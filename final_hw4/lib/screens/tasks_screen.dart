import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/task_bloc.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks Screen')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text('Enter Task:'),
            TextField(
              onChanged: (value) {
                context.read<TaskBloc>().add(AddTask(value));
              },
            ),
            BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                if (state is TaskAdded) {
                  return Text('Task: ${state.task}');
                }
                return const Text('No Task');
              },
            ),
          ],
        ),
      ),
    );
  }
}

