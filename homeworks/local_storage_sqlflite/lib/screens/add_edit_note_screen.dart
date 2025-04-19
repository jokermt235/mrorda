import 'package:flutter/material.dart';
import '../model/note.dart';
import '../db/notes_database.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({super.key, this.note});

  @override
  _AddEditNoteScreenState createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!.title;
      contentController.text = widget.note!.content;
    }
  }

  Future saveNote() async {
    final title = titleController.text;
    final content = contentController.text;

    if (title.isEmpty || content.isEmpty) return;

    final note = Note(
      id: widget.note?.id,
      title: title,
      content: content,
    );

    if (widget.note == null) {
      await NotesDatabase.instance.create(note);
    } else {
      await NotesDatabase.instance.update(note);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'Add Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Content'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveNote,
              child: Text(widget.note == null ? 'Save' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
