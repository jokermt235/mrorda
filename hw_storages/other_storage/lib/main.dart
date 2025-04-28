import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Storage App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NameStorageScreen(),
    );
  }
}

class NameStorageScreen extends StatefulWidget {
  const NameStorageScreen({super.key});

  @override
  State<NameStorageScreen> createState() => _NameStorageScreenState();
}

class _NameStorageScreenState extends State<NameStorageScreen> {
  final TextEditingController _nameController = TextEditingController();
  List<String> savedNames = [];

  @override
  void initState() {
    super.initState();
    _loadNames();
  }


  Future<void> _loadNames() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      savedNames = prefs.getStringList('saved_names') ?? [];
    });
  }


  Future<void> _saveName() async {
    if (_nameController.text.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    savedNames.add(_nameController.text);
    await prefs.setStringList('saved_names', savedNames);

    setState(() {
      _nameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save Names'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Enter a name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveName,
              child: const Text('Save Name'),
            ),
            const SizedBox(height: 24),
            const Text(
              'Saved Names:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: savedNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(savedNames[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}