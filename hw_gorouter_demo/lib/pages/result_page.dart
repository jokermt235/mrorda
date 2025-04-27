import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResultPage extends StatelessWidget {
  final String subject;
  final String score;

  const ResultPage({super.key, required this.subject, required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Center(
        child: Text("Subject: $subject\nScore: $score",
            style: const TextStyle(fontSize: 24), textAlign: TextAlign.center),
      ),
    );
  }
}
