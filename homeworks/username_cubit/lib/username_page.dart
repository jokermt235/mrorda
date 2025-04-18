import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/username_cubit.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameCubit = context.read<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Username Cubit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<UsernameCubit, UsernameState>(
              builder: (context, state) {
                return Text(
                  'Username: ${state.username}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                usernameCubit.updateUsername(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
