import 'package:flutter/material.dart';

class BookViewer extends StatefulWidget {
  final List<String> pages;

  const BookViewer({super.key, required this.pages});

  @override
  State<BookViewer> createState() => _BookViewerState();
}

class _BookViewerState extends State<BookViewer> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Viewer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.pages[_currentPage],
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Page ${_currentPage + 1} of ${widget.pages.length}',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (_currentPage > 0)
            FloatingActionButton(
              onPressed: () => setState(() => _currentPage--),
              child: const Icon(Icons.arrow_back),
            ),
          const SizedBox(width: 10),
          if (_currentPage < widget.pages.length - 1)
            FloatingActionButton(
              onPressed: () => setState(() => _currentPage++),
              child: const Icon(Icons.arrow_forward),
            ),
        ],
      ),
    );
  }
}
