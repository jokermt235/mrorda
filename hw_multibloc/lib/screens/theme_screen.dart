import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/theme/theme_bloc.dart';
import '../blocs/theme/theme_event.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Тема')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<ThemeBloc>().add(ToggleTheme());
          },
          child: const Text('Переключить тему'),
        ),
      ),
    );
  }
}