import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/username_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => UsernameCubit(),
        child: UsernamePage(),
      ),
    );
  }
}

class UsernamePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usernameCubit = context.read<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Username Page')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onChanged: (value) {
                usernameCubit.updateUsername(value);
              },
              decoration: InputDecoration(labelText: 'Enter username'),
            ),
            SizedBox(height: 20),
            BlocBuilder<UsernameCubit, String>(
              builder: (context, username) {
                return Text('Hello, $username');
              },
            ),
          ],
        ),
      ),
    );
  }
}
