import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'note.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _notesBox = Hive.box<Note>('notesBox');
  final _controller = TextEditingController();

  void _addNote(String text) {
    if (text.isEmpty) return;

    final newNote = Note(title: text);
    _notesBox.add(newNote);

    _controller.clear();

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Note added!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Notes")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Enter note title",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _addNote(_controller.text),
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: _notesBox.listenable(),
              builder: (context, box, _) {
                if (box.isEmpty) {
                  return const Center(child: Text("No notes yet"));
                }

                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final note = box.getAt(index);

                    return ListTile(title: Text(note?.title ?? "Untitled"));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
