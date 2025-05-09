import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChapterPage extends StatelessWidget {
  final int chapterNumber;
  final String story;
  final Map<int, String> chapters;

  const ChapterPage({
    super.key,
    required this.chapterNumber,
    required this.story,
    required this.chapters,
  });

  void _goToNext(BuildContext context) {
    int next = chapterNumber < chapters.length ? chapterNumber + 1 : 1;
    context.go('/chapter/$next');
  }

  void _goToPrevious(BuildContext context) {
    int prev = chapterNumber > 1 ? chapterNumber - 1 : chapters.length;
    context.go('/chapter/$prev');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter $chapterNumber"),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  story,
                  style: const TextStyle(fontSize: 18, height: 1.6),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _goToPrevious(context),
                  child: const Text("Previous"),
                ),
                ElevatedButton(
                  onPressed: () => _goToNext(context),
                  child: const Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}