import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.go('/page1/John');
            },
            child: Text('Go to Page1 (name)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/page2/25');
            },
            child: Text('Go to Page2 (age)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/page3/London');
            },
            child: Text('Go to Page3 (city)'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/page4', extra: 'Hello from HomePage!');
            },
            child: Text('Go to Page4 (extra param)'),
          ),
        ],
      ),
    );
  }
}
