import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🏠 Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/page1/Alice'),
              child: const Text('Go to Page 1 with name'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page2/21'),
              child: const Text('Go to Page 2 with age'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page3/blue'),
              child: const Text('Go to Page 3 with color'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/page4/HelloWorld'),
              child: const Text('Go to Page 4 with message'),
            ),
          ],
        ),
      ),
    );
  }
}
