import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_cubit.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsernameCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Username Duplicator')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Enter your username',
                ),
                onChanged: (value) {
                  context.read<UsernameCubit>().updateUsername(value);
                },
              ),
              const SizedBox(height: 32),
              BlocBuilder<UsernameCubit, String>(
                builder: (context, username) {
                  return Text(
                    'Your username is: $username',
                    style: const TextStyle(fontSize: 20),
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
