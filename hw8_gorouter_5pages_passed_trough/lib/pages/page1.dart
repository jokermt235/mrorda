import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page1 extends StatelessWidget {
  final String message;
  const Page1({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Message: $message'),
            ElevatedButton(
              onPressed: () {
                context.go('/page2/42');
              },
              child: const Text('Go to Page 2 with number'),
            ),
          ],
        ),
      ),
    );
  }
}
