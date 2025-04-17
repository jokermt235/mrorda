// lib/open_book_screen.dart
import 'package:flutter/material.dart';
import 'models/book.dart';

class OpenBookScreen extends StatefulWidget {
  final Book book;

  OpenBookScreen({required this.book});

  @override
  _OpenBookScreenState createState() => _OpenBookScreenState();
}

class _OpenBookScreenState extends State<OpenBookScreen> {
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < widget.book.pages.length - 1) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title)),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: double.infinity, // Ширина на весь экран
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.book.pages[_currentPage],
                    style: TextStyle(fontSize: 18, height: 1.5),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _previousPage,
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: _nextPage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
