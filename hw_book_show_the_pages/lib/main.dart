import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'book_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
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
    "Page 1: Once upon a time...",
    "Page 2: The adventure continues...",
    "Page 3: A new twist unfolds...",
    "Page 4: The grand finale!"
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
            Text(pages[pageIndex], style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: pageIndex > 0 ? () => ref.read(bookProvider.notifier).previousPage() : null,
                  child: Text("Previous"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: pageIndex < pages.length - 1 ? () => ref.read(bookProvider.notifier).nextPage() : null,
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