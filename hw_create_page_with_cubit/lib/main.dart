import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => UsernameCubit(),
        child: UsernamePage(),
      ),
    );
  }
}

class UsernamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usernameCubit = context.read<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Cubit Username Input')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                usernameCubit.updateUsername(value);
              },
            ),
            SizedBox(height: 20),
            BlocBuilder<UsernameCubit, UsernameState>(
              builder: (context, state) {
                return Text(
                  '${state.username} ${state.username}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}