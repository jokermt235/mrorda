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
      title: 'Username Cubit Example',
      theme: ThemeData(primarySwatch: Colors.blue),
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
      appBar: AppBar(title: const Text('Enter Username')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ввод имени
            TextField(
              onChanged: (username) {
                context.read<UsernameCubit>().updateUsername(username);
              },
              decoration: const InputDecoration(labelText: 'Enter Username'),
            ),
            const SizedBox(height: 20),
            // Отображение введённого имени
            BlocBuilder<UsernameCubit, UsernameState>(
              builder: (context, state) {
                return Text(
                  'Username: ${state.username}',
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
