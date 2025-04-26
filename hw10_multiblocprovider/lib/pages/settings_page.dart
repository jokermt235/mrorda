import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/theme_cubit.dart';
import '../cubits/theme_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Page')),
      body: Center(
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return SwitchListTile(
              title: const Text('Dark Mode'),
              value: state.isDarkMode,
              onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
            );
          },
        ),
      ),
    );
  }
}
