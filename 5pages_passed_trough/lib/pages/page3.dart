import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page3 extends StatelessWidget {
  final String text;
  const Page3({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received text: $text'),
            ElevatedButton(
              onPressed: () {
                context.go('/page4/FinalInfo');
              },
              child: const Text('Go to Page 4 with text'),
            ),
          ],
        ),
      ),
    );
  }
}
