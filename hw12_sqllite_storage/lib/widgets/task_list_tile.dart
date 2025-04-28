import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hw12_sqllite_storage/db/tasks_database.dart';
import 'package:hw12_sqllite_storage/extensions/extensions.dart';
import 'package:hw12_sqllite_storage/models/task.dart';

class TaskListTile extends StatefulWidget {
  const TaskListTile({super.key, required this.task});

  final Task task;

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  bool isCompleted = false;

  @override
  void initState() {
    isCompleted = widget.task.isCompleted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: CupertinoListTile(
          leading: Transform.scale(
            scale: 1.5,
            child: CupertinoCheckbox(
              shape: const CircleBorder(),
              value: isCompleted,
              onChanged: (value) async {
                setState(() {
                  isCompleted = value ?? false;
                });
                await TasksDatabase.instance.markTaskAsCompleted(
                  id: widget.task.id!,
                  isCompleted: isCompleted,
                );
              },
            ),
          ),
          title: Text(
            widget.task.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(widget.task.description, maxLines: 3),
          trailing: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.task.startDate.format()),
          ),
        ),
      ),
    );
  }
}
