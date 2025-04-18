import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/user_bloc.dart';
import 'blocs/task_bloc.dart';
import 'screens/home_screen.dart';
import 'screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MultiBlocProvider Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/tasks': (context) => const TasksScreen(),
      },
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => UserBloc()),
            BlocProvider(create: (_) => TaskBloc()),
          ],
          child: child!,
        );
      },
    );
  }
}
