import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_cubit.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Screen')),
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, themeMode) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current theme: ${themeMode == ThemeMode.light ? "Light" : "Dark"}',
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                  child: const Text('Toggle theme'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
