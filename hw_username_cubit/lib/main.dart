import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'username_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Username Duplicator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsernamePage(),
    );
  }
}


