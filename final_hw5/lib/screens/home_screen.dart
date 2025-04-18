import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../database/database_helper.dart';
import '../models/data_model.dart';
import 'data_screen.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text('Enter some data:'),
            TextField(controller: _controller),
            ElevatedButton(
              onPressed: () async {
                final data = DataModel(data: _controller.text);
                await DatabaseHelper.instance.insertData(data);
                _controller.clear();
              },
              child: const Text('Save Data'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DataScreen()),
                );
              },
              child: const Text('View Saved Data'),
            ),
          ],
        ),
      ),
    );
  }
}

