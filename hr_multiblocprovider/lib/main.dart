import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/counter_bloc.dart';
import 'blocs/theme_bloc.dart';
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
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, themeData) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Stylish BLoC App',
            theme: themeData,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
