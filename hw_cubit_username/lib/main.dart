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
      title: 'Cubit Username',
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
    final cubit = context.read<UsernameCubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Username Input')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Enter username'),
              onChanged: cubit.updateUsername,
            ),
            const SizedBox(height: 30),
            BlocBuilder<UsernameCubit, String>(
              builder: (context, state) => Text(
                state.isEmpty ? 'Waiting for input...' : state,
                style: const TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
