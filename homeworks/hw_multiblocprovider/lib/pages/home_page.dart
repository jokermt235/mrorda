import 'package:flutter/material.dart';
import 'counter_page.dart';
import 'username_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Go to Counter Page"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CounterPage()),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Go to Username Page"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UsernamePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
