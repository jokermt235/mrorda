import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => UsernameCubit(),
        child: const UsernamePage(),
      ),
    );
  }
}

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameCubit = context.read<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('Username Duplicator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter your username',
              ),
              onChanged: (value) {
                usernameCubit.updateUsername(value);
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<UsernameCubit, String>(
              builder: (context, username) {
                return Text(
                  username.isEmpty
                      ? 'Your username will appear here'
                      : username,
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
