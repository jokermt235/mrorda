import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/username_cubit.dart';
import 'username_page.dart';

void main() {
  runApp(const UsernameApp());
}

class UsernameApp extends StatelessWidget {
  const UsernameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Username Cubit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (_) => UsernameCubit(),
        child: const UsernamePage(),
      ),
    );
  }
}
