import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class QuotePage extends StatelessWidget {
  final int pageNumber;
  final String quote;
  final String author;
  final int total;

  const QuotePage({
    Key? key,
    required this.pageNumber,
    required this.quote,
    required this.author,
    required this.total,
  }) : super(key: key);

  void _goToNextPage(BuildContext context) {
    final next = pageNumber < total ? pageNumber + 1 : 1;
    context.go('/quote/$next');
  }

  void _goToPreviousPage(BuildContext context) {
    final prev = pageNumber > 1 ? pageNumber - 1 : total;
    context.go('/quote/$prev');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote $pageNumber'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  '"$quote"\n\n- $author',
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _goToPreviousPage(context),
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: () => _goToNextPage(context),
                  child: const Text('Next'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}