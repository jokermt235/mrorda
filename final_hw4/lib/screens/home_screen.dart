import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text('Enter Username:'),
            TextField(
              onChanged: (value) {
                context.read<UserBloc>().add(SetUsername(value));
              },
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserUpdated) {
                  return Text('Username: ${state.username}');
                }
                return const Text('No Username');
              },
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tasks');
              },
              child: const Text('Go to Tasks Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
