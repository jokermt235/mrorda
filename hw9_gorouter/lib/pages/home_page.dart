import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                context.go('/page1/Hello from Page 1');
              },
              child: const Text('Go to Page 1'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                context.go('/page2/Welcome to Page 2');
              },
              child: const Text('Go to Page 2'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                context.go('/page3/This is Page 3');
              },
              child: const Text('Go to Page 3'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                context.go('/page4/Enjoy Page 4');
              },
              child: const Text('Go to Page 4'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                context.go('/page5/Final Page 5');
              },
              child: const Text('Go to Page 5'),
            ),
          ),
        ],
      ),
    );
  }
}
