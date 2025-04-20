import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/username_cubit.dart';
import 'pages/username_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsernameCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: UsernamePage(),
      ),
    );
  }
}