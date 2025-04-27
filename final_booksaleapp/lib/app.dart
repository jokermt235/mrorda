import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, // Use routerConfig here
      title: 'Final Book Sale App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}