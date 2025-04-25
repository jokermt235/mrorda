import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter/counter_bloc.dart';
import 'blocs/username/username_bloc.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => UsernameBloc()),
      ],
      child: MaterialApp(
        title: 'Bloc App',
        theme: ThemeData(primarySwatch: Colors.teal),
        home: const HomeScreen(),
      ),
    );
  }
}
