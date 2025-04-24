import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/theme_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeBloc = context.read<ThemeBloc>();
    final isDarkMode =
        context.select<ThemeBloc, bool>((bloc) => bloc.state == ThemeMode.dark);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: SwitchListTile(
          title: const Text('Dark Theme'),
          value: isDarkMode,
          onChanged: (_) => themeBloc.add(ToggleTheme()),
        ),
      ),
    );
  }
}
