import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/username_cubit.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Username Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => context.read<UsernameCubit>().update(value),
              decoration: const InputDecoration(labelText: "Enter your name"),
            ),
            const SizedBox(height: 20),
            BlocBuilder<UsernameCubit, String>(
              builder:
                  (context, name) => Text(
                    "You typed: $name",
                    style: const TextStyle(fontSize: 20),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
