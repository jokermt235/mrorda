import 'package:flutter/material.dart';
import '../db/note_database.dart';
import '../models/note_model.dart';

class NoteEditScreen extends StatefulWidget {
  final Note? note;
  NoteEditScreen({this.note});

  @override
  _NoteEditScreenState createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
  }

  void saveNote() async {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isEmpty || content.isEmpty) return;

    if (widget.note == null) {
      await NoteDatabase.instance.create(Note(title: title, content: content));
    } else {
      await NoteDatabase.instance.update(Note(
        id: widget.note!.id,
        title: title,
        content: content,
      ));
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.note == null ? 'Add Note' : 'Edit Note')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'Content'),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveNote,
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}
