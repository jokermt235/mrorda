// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/theme_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: BlocBuilder<ThemeBloc, bool>(
          builder: (context, isDark) => SwitchListTile(
            title: Text('Dark Mode: ${isDark ? 'ON' : 'OFF'}'),
            value: isDark,
            onChanged: (value) => context.read<ThemeBloc>().add(ToggleTheme()),
          ),
        ),
      ),
    );
  }
}