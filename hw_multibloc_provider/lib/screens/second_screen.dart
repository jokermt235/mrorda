import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/username/username_bloc.dart';
import '../blocs/username/username_event.dart';
import '../blocs/username/username_state.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Username Screen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<UsernameBloc, UsernameState>(
              builder: (context, state) {
                return Text(
                  state.username.isEmpty ? 'Enter your username' : 'Hello, ${state.username}!',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Username'),
              onChanged: (value) {
                context.read<UsernameBloc>().add(SetUsername(value));
              },
            ),
          ],
        ),
      ),
    );
  }
}
