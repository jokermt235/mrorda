import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/username_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit Input Example',
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
    return Scaffold(
      appBar: AppBar(title: const Text('Username Duplicator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Enter username'),
              onChanged: (value) {
                context.read<UsernameCubit>().updateUsername(value);
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<UsernameCubit, String>(
              builder: (context, username) {
                return Text(
                  'You typed: $username',
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
