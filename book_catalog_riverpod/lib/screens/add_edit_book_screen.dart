import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/book_model.dart';
import '../providers/book_provider.dart';

class AddEditBookScreen extends ConsumerStatefulWidget {
  final Book? book;

  const AddEditBookScreen({super.key, this.book});

  @override
  ConsumerState<AddEditBookScreen> createState() => _AddEditBookScreenState();
}

class _AddEditBookScreenState extends ConsumerState<AddEditBookScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _author;
  late String _year;

  @override
  void initState() {
    super.initState();
    if (widget.book != null) {
      _title = widget.book!.title;
      _author = widget.book!.author;
      _year = widget.book!.year.toString();
    } else {
      _title = '';
      _author = '';
      _year = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book == null ? 'Add Book' : 'Edit Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                initialValue: _author,
                decoration: const InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an author';
                  }
                  return null;
                },
                onSaved: (value) => _author = value!,
              ),
              TextFormField(
                initialValue: _year,
                decoration: const InputDecoration(labelText: 'Year'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a year';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid year';
                  }
                  return null;
                },
                onSaved: (value) => _year = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final book = Book(
                      id: widget.book?.id,
                      title: _title,
                      author: _author,
                      year: int.parse(_year),
                    );

                    if (widget.book == null) {
                      ref.read(bookProvider.notifier).addBook(book);
                    } else {
                      ref.read(bookProvider.notifier).updateBook(widget.book!.id, book);
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text(widget.book == null ? 'Add Book' : 'Update Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}