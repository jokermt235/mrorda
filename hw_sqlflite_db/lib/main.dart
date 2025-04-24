import 'package:flutter/material.dart';
import 'db/note_database.dart';
import 'models/note_model.dart';
import 'screens/note_edit_screen.dart';

void main() {
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: NoteListScreen(),
    );
  }
}

class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> notes = [];

  @override
  void initState() {
    super.initState();
    refreshNotes();
  }

  Future refreshNotes() async {
    final data = await NoteDatabase.instance.readAllNotes();
    setState(() => notes = data);
  }

  void addOrEditNote({Note? note}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteEditScreen(note: note)),
    );
    if (result == true) {
      refreshNotes();
    }
  }

  void deleteNote(int id) async {
    await NoteDatabase.instance.delete(id);
    refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Notes')),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            onTap: () => addOrEditNote(note: note),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => deleteNote(note.id!),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addOrEditNote(),
      ),
    );
  }
}
