import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageB extends StatelessWidget {
  final String someData;
  PageB({required this.someData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page B')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Data Received: $someData'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.go('/page_c?value=456');
              },
              child: Text('Go to Page C (value=456)'),
            ),
             SizedBox(height: 10),
             ElevatedButton(
               onPressed: () {
                 context.go('/page_c?value=999');
               },
               child: Text('Go to Page C (value=999)'),
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