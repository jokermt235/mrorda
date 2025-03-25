import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lesson9riverpod/book.dart';
import 'package:lesson9riverpod/book_cover.dart';
import 'package:lesson9riverpod/book_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'book_provider.dart';

void main() {
  runApp(
      ProviderScope(
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: RiverPage(),
    );
  }
}


class RiverPage extends StatelessWidget{
  const RiverPage({super.key});
  @override
  Widget build(BuildContext context){
    return Consumer(
      builder: (context, ref, child){
        final AsyncValue<List<Book>> books = ref.watch(bookProvider);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Bookshelf"),
          ),
          body: Container(
            child: books.when(
                data: (bookList){
                  return Column(
                    children: bookList.map(
                        (book) => GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:(context)=>BookView(data: book)
                              )
                            );
                          },
                          child: BookCover(data: book),
                        )
                    ).toList(),
                  );
                },
                error: (err, _ )=>Text("Error $err"),
                loading: ()=>CircularProgressIndicator()
            )
          ),
        );
      },
    );
  }
}

class MyHomePage extends ConsumerWidget{
  final helloWorldProvider = StateProvider.autoDispose<String>((ref) => "HI");
  @override
  Widget build(BuildContext context, WidgetRef ref){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(ref.watch(helloWorldProvider)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

