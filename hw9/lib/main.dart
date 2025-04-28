import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/username_cubit.dart';
import 'pages/username_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Username',
      home: BlocProvider(
        create: (_) => UsernameCubit(),
        child: const UsernamePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
