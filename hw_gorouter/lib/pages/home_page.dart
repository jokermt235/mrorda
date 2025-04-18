import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  final Map<int, String> chapters;

  const HomePage({super.key, required this.chapters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StoryBook")),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final number = index + 1;
          final title = chapters[number]?.split('\n').first ?? 'Chapter $number';
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 4,
            child: ListTile(
              title: Text(title),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => context.go('/chapter/$number'),
            ),
          );
        },
      ),
    );
  }
}