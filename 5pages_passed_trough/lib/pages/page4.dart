import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page4 extends StatelessWidget {
  final String text;
  const Page4({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 4')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received text: $text'),
            ElevatedButton(
              onPressed: () {
                context.go('/page5/FinalInfo');
              },
              child: const Text('Go to Page 5 with info'),
            ),
          ],
        ),
      ),
    );
  }
}
