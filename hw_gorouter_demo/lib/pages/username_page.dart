import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/username_cubit.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Enter Username",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<UsernameCubit>().updateUsername(value);
              },
            ),
            const SizedBox(height: 30),
            BlocBuilder<UsernameCubit, String>(
              builder: (context, state) {
                return Text(
                  "You typed: $state",
                  style: const TextStyle(fontSize: 18, color: Colors.deepPurple),
                );
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: () {
                final username = context.read<UsernameCubit>().state.trim();
                if (username.isNotEmpty) {
                  context.go('/profile/$username');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter a username")),
                  );
                }
              },
              icon: const Icon(Icons.login),
              label: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
