import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'book_provider.dart';


void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookReader(),
    );
  }
}


class BookReader extends ConsumerWidget {
  final List<String> pages = [
    "Page 1: Крокодилы не могут высовывать язык!",
    "Page 2: Сердце кита бьется всего 9 раз в минуту.",
    "Page 3: В Швеции есть отель изо льда, который каждый год отстраивают заново.",
    "Page 4: Пока вы читали эти страницы,  я надеюсь вы узнали что-то новое )))"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(bookProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Book Reader')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pages[pageIndex], style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: pageIndex > 0 ? () =>
                      ref.read(bookProvider.notifier).previousPage() : null,
                  child: Text("Previous"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: pageIndex < pages.length - 1 ? () =>
                      ref.read(bookProvider.notifier).nextPage() : null,
                  child: Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
