import 'package:flutter/material.dart';
import 'router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'GoRouter Simple Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}