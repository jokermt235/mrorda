import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/theme_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is the Home Screen"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/counter'),
              child: const Text("Go to Counter Screen"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              child: const Text("Toggle Theme"),
            ),
          ],
        ),
      ),
    );
  }
}
