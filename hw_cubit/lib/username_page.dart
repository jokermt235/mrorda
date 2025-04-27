import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'username_cubit.dart';

class UsernamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsernameCubit(),
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('Username Input'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<UsernameCubit, String>(
                builder: (context, username) {
                  return TextField(
                    decoration: InputDecoration(
                      hintText: 'Введите ваше имя...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 24.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      prefixIcon: Icon(Icons.person, color: Colors.deepPurple),
                    ),
                    style: TextStyle(fontSize: 18),
                    onChanged: (value) {
                      context.read<UsernameCubit>().updateUsername(value);
                    },
                  );
                },
              ),
              SizedBox(height: 30),
              BlocBuilder<UsernameCubit, String>(
                builder: (context, username) {
                  return Center(
                    child: Text(
                      username,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
