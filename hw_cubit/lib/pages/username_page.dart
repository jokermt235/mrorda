import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/username_cubit.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Username Input")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Enter your name'),
              onChanged: (value) {
                context.read<UsernameCubit>().updateUsername(value);
              },
            ),
            const SizedBox(height: 30),
            BlocBuilder<UsernameCubit, String>(
              builder: (context, username) {
                return Text(
                  username.isEmpty ? 'Waiting for input...' : 'Hello, $username!',
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