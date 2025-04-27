import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'username_cubit.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsernameCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Username Duplicator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _UsernameInput(),
              const SizedBox(height: 20),
              _DuplicatedText(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (username) {
        context.read<UsernameCubit>().updateUsername(username);
      },
      decoration: const InputDecoration(
        labelText: 'Enter username',
        border: OutlineInputBorder(),
      ),
    );
  }
}

class _DuplicatedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsernameCubit, UsernameState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Original: ${state.username}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Duplicated: ${state.duplicated}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        );
      },
    );
  }
}