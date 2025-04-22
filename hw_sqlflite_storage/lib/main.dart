import 'package:flutter/material.dart';
import 'note.dart';
import 'note_database.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFLite Notes Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final controller = TextEditingController();
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  Future<void> _refreshNotes() async {
    notes = await NoteDatabase.instance.readAllNotes();
    setState(() {});
  }

  Future<void> _addNote() async {
    final text = controller.text.trim();
    if (text.isEmpty) return;
    await NoteDatabase.instance.create(Note(content: text));
    controller.clear();
    await _refreshNotes();
  }

  Future<void> _deleteNote(int id) async {
    await NoteDatabase.instance.delete(id);
    await _refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQFLite Notes')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(labelText: 'Enter note'),
                  ),
                ),
                IconButton(icon: const Icon(Icons.add), onPressed: _addNote),
              ],
            ),
          ),
          Expanded(
            child:
                notes.isEmpty
                    ? const Center(child: Text('No notes yet.'))
                    : ListView.builder(
                      itemCount: notes.length,
                      itemBuilder: (context, index) {
                        final note = notes[index];
                        return ListTile(
                          title: Text(note.content),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteNote(note.id!),
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
