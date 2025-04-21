import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/book_provider.dart';

class BookScreen extends ConsumerWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pages = ref.watch(bookPagesProvider);
    final currentPageIndex = ref.watch(currentPageProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("📚 Book Viewer")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Страница ${pages[currentPageIndex].pageNumber}",
                style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(pages[currentPageIndex].content,
                  style: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: currentPageIndex > 0
                      ? () => ref
                          .read(currentPageProvider.notifier)
                          .update((state) => state - 1)
                      : null,
                  child: const Text("⬅️ Назад"),
                ),
                ElevatedButton(
                  onPressed: currentPageIndex < pages.length - 1
                      ? () => ref
                          .read(currentPageProvider.notifier)
                          .update((state) => state + 1)
                      : null,
                  child: const Text("Вперёд ➡️"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
