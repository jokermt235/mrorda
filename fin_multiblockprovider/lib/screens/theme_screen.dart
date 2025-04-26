import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/theme_cubit.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Toggle')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Toggle Theme'),
          onPressed: themeCubit.toggleTheme,
        ),
      ),
    );
  }
}
