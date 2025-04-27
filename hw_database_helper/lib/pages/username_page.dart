import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/username/username_cubit.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Username Input')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<UsernameCubit>().updateUsername(value);
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<UsernameCubit, UsernameState>(
              builder: (context, state) {
                if (state is UsernameUpdated) {
                  return Column(
                    children: [
                      Text('Entered: ${state.username}'),
                      Text('Duplicated: ${state.username * 2}'),
                    ],
                  );
                }
                return const Text('No username entered');
              },
            ),
          ],
        ),
      ),
    );
  }
}