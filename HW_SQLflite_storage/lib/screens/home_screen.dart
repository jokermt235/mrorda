// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import '../model/task_model.dart';
import '../db/database_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Task> _tasks = [];

  void _loadTasks() async {
    final tasks = await DatabaseHelper().getTasks();
    setState(() {
      _tasks = tasks;
    });
  }

  void _addTask() async {
    if (_controller.text.isNotEmpty) {
      await DatabaseHelper().insertTask(Task(title: _controller.text));
      _controller.clear();
      _loadTasks();
    }
  }

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLite To-Do App")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Enter task'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(_tasks[index].title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
