import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageScreen extends StatelessWidget {
  final String title;
  final String message;

  const PageScreen({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center( 
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              Text(
                message,
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Text('Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

