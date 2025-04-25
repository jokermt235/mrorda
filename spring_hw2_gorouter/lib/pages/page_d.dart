import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageD extends StatelessWidget {
  final String itemId;
  final String description;
  PageD({required this.itemId, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page D')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Item ID: $itemId'),
            SizedBox(height: 10),
            Text('Description: $description'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: Text('Go to Home'),
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
