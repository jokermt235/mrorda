import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'username_cubit.dart';
import 'theme_cubit.dart';
import 'counter_screen.dart';
import 'username_screen.dart';
import 'theme_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => UsernameCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'MultiBlocProvider Example',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: themeMode,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MultiBlocProvider App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to Counter Screen'),
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CounterScreen()),
                  ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              child: const Text('Go to Username Screen'),
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const UsernameScreen()),
                  ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              child: const Text('Go to Theme Screen'),
              onPressed:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ThemeScreen()),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
