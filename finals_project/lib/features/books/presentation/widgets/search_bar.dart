import 'package:finals_project/features/books/bloc/book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookSearchBar extends StatefulWidget {
  const BookSearchBar({super.key});

  @override
  State<BookSearchBar> createState() => _BookSearchBarState();
}

class _BookSearchBarState extends State<BookSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search books...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _controller.clear();
              context.read<BookBloc>().add(SearchBooksEvent(''));
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        onChanged: (query) =>
            context.read<BookBloc>().add(SearchBooksEvent(query)),
      ),
    );
  }
}
