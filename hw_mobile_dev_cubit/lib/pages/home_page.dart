import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/username_cubit.dart';
import '../cubit/username_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username Duplicator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Enter your username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<UsernameCubit>().updateUsername(value);
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<UsernameCubit, UsernameState>(
              builder: (context, state) {
                return Text(
                  'Duplicated: ${state.username}',
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}