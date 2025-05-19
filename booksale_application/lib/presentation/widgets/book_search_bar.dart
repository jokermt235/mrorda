import 'package:flutter/material.dart';
import '../../core/utils/debouncer.dart';

class BookSearchBar extends StatefulWidget {
  final Function(String) onSearch;
  const BookSearchBar({super.key, required this.onSearch});

  @override
  State<BookSearchBar> createState() => _BookSearchBarState();
}

class _BookSearchBarState extends State<BookSearchBar> {
  final Debouncer _debouncer = Debouncer();

  @override
  void dispose() {
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Search books...',
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (query) => _debouncer.run(() => widget.onSearch(query)),
    );
  }
}