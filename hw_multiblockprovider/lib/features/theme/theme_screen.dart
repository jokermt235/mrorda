import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw_multiblockprovider/features/theme/theme_bloc.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки темы'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Switch(
                  value: state is DarkThemeState,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ToggleTheme());
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return Text(
                  state is DarkThemeState ? 'Темная тема' : 'Светлая тема',
                  style: Theme.of(context).textTheme.titleMedium,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}