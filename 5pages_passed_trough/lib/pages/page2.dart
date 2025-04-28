import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatelessWidget {
  final String number;
  const Page2({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received number: $number'),
            ElevatedButton(
              onPressed: () {
                context.go('/page3/HelloPage3');
              },
              child: const Text('Go to Page 3 with text'),
            ),
          ],
        ),
      ),
    );
  }
}
