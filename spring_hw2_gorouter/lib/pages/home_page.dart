import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/page_a/user123');
              },
              child: Text('Go to Page A (User: user123)'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.go('/page_a/anotherUser');
              },
              child: Text('Go to Page A (User: anotherUser)'),
            ),
          ],
        ),
      ),
    );
  }
}
