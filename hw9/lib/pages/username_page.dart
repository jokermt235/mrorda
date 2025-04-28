import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/username_cubit.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final usernameCubit = context.read<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Usernames'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                usernameCubit.addUsername(value);
                _controller.clear();
              },
              decoration: const InputDecoration(
                labelText: 'Enter username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<UsernameCubit, List<String>>(
                builder: (context, usernames) {
                  return ListView.builder(
                    itemCount: usernames.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(usernames[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
