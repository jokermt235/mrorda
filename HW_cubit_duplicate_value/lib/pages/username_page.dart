import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/username_cubit.dart';
import '../cubit/username_state.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameCubit = context.read<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text("Username Input")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Enter username'),
              onChanged: (value) {
                usernameCubit.updateUsername(value);
              },
            ),
            const SizedBox(height: 24),
            BlocBuilder<UsernameCubit, UsernameState>(
              builder: (context, state) {
                return Text(
                  'You typed: ${state.username}',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
