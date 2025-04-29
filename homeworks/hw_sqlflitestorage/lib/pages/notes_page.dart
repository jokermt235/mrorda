import 'package:flutter/material.dart';
import '../db/notes_database.dart';
import '../models/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _controller = TextEditingController();
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final notes = await NotesDatabase.instance.readAllNotes();
    setState(() {
      _notes = notes;
    });
  }

  Future<void> _addNote() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    final newNote = Note(content: text);
    await NotesDatabase.instance.create(newNote);
    _controller.clear();
    _loadNotes();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Notes with SQLite")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter note',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(onPressed: _addNote, child: const Text("Save")),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (_, index) {
                final note = _notes[index];
                return ListTile(title: Text(note.content));
              },
            ),
          ),
        ],
      ),
    );
  }
}
