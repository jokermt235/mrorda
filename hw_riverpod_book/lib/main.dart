import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'book_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: MaterialApp(home: BookPage()));
  }
}

class BookPage extends ConsumerWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(currentPageProvider.state).state;

    return Scaffold(
      appBar: AppBar(title: Text('Page $currentPage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is page $currentPage', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (currentPage < 5) {
                  ref.read(currentPageProvider.state).state = currentPage + 1;
                } else {
                  ref.read(currentPageProvider.state).state = 1;
                }
              },
              child: Text(currentPage == 5 ? 'Start Over' : 'Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}
