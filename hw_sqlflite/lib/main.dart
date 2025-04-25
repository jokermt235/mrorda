import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/username/username_bloc.dart';
import 'screens/username_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsernameBloc(),
      child: MaterialApp(
        home: const UsernameScreen(),
      ),
    );
  }
}
