import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';
import 'bloc/counter_event.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // you can add more BlocProviders here
        BlocProvider<CounterBloc>(
          create: (_) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'MultiBlocProvider Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}