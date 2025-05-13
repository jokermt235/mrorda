import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_cubit.dart';

class UsernamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Username Input (Cubit)'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Username',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                context.read<UsernameCubit>().updateUsername(value);
              },
            ),
            SizedBox(height: 30),

            BlocBuilder<UsernameCubit, String>(
              builder: (context, usernameState) {
                return Text(
                  'Entered Username: $usernameState',
                  style: TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}