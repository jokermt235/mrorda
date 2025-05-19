import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_page.dart';
import 'counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      home: CounterPage(),
    );
  }
}