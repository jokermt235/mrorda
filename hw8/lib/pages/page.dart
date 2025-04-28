import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoryPage extends StatelessWidget {
  final int page;
  final String text;

  const StoryPage({super.key, required this.page, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Страница $page')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 22),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    final prevPage = page > 1 ? page - 1 : 5;
                    context.go('/$prevPage');
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () {
                    final nextPage = page < 5 ? page + 1 : 1;
                    context.go('/$nextPage');
                  },
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
