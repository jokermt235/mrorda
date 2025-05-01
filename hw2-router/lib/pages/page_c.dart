import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageC extends StatelessWidget {
  final int numericValue;
  PageC({required this.numericValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page C')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Value Received: $numericValue'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.push(
                  '/page_d/itemXYZ',
                  extra: {'description': 'This is an important item'},
                );
              },
              child: Text('Go to Page D (itemXYZ)'),
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