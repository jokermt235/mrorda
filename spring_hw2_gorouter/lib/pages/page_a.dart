import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageA extends StatelessWidget {
  final String userId;
  PageA({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page A')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User ID: $userId'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.push('/page_b', extra: 'Hello from Page A');
              },
              child: Text('Go to Page B (Pass Data)'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
