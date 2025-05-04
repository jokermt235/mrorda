import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookPage extends StatelessWidget {
  final int pageNumber;
  final String story;
  final Map<int, String> chapters;

  const BookPage({
    Key? key,
    required this.pageNumber,
    required this.story,
    required this.chapters,
  }) : super(key: key);

  void _goToNextPage(BuildContext context) {
    int nextPage = pageNumber < chapters.length ? pageNumber + 1 : 1;
    context.go('/page/$nextPage');
  }

  void _goToPreviousPage(BuildContext context) {
    int previousPage = pageNumber > 1 ? pageNumber - 1 : chapters.length;
    context.go('/page/$previousPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Страница $pageNumber'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  story,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _goToPreviousPage(context),
                  child: const Text('Предыдущая'),
                ),
                ElevatedButton(
                  onPressed: () => _goToNextPage(context),
                  child: const Text('Следующая'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
