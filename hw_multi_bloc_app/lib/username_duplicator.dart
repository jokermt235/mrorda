import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_app/username_cubit.dart';

class UsernameDuplicator extends StatelessWidget {
  const UsernameDuplicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsernameCubit(),
      child: Column(
        children: [
          const Text('Username Duplicator', style: TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          BlocBuilder<UsernameCubit, UsernameState>(
            builder: (context, state) {
              return Column(
                children: [
                  TextField(
                    onChanged: (value) =>
                        context.read<UsernameCubit>().updateUsername(value),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter username',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Duplicated: ${state.duplicatedUsername}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}