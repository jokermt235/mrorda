import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_cubit.dart';
import 'username_state.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsernameCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Username Input')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocBuilder<UsernameCubit, UsernameState>(
                builder: (context, state) {
                  return TextField(
                    decoration: const InputDecoration(labelText: 'Enter username'),
                    onChanged: (value) {
                      context.read<UsernameCubit>().updateUsername(value);
                    },
                  );
                },
              ),
              const SizedBox(height: 32),
              BlocBuilder<UsernameCubit, UsernameState>(
                builder: (context, state) {
                  return Text(
                    'You entered: ${state.username}',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
