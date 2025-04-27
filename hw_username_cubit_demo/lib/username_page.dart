import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_cubit.dart';

class UsernamePage extends StatelessWidget {
  const UsernamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Username Input")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Enter your username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<UsernameCubit>().update(value);
              },
            ),
            const SizedBox(height: 20),
            const Text("You typed:"),
            BlocBuilder<UsernameCubit, String>(
              builder: (context, username) {
                return Text(
                  username,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
