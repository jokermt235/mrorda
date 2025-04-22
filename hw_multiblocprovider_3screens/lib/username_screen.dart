import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_cubit.dart';

class UsernameScreen extends StatelessWidget {
  const UsernameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Username Screen')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            BlocBuilder<UsernameCubit, String>(
              builder: (context, username) {
                return TextField(
                  decoration: const InputDecoration(
                    labelText: 'Enter username',
                  ),
                  onChanged:
                      (value) => context.read<UsernameCubit>().update(value),
                );
              },
            ),
            const SizedBox(height: 24),
            BlocBuilder<UsernameCubit, String>(
              builder: (context, username) {
                return Text(
                  username,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
