import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_sales/features/books/bloc/book_bloc.dart';
import 'package:book_sales/features/books/bloc/book_event.dart';

class BookSearchBar extends StatefulWidget {
  const BookSearchBar({super.key});

  @override
  State<BookSearchBar> createState() => _BookSearchBarState();
}

class _BookSearchBarState extends State<BookSearchBar> {
  Timer? _debounce;
  String _lastQuery = '';

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onChanged(String query) {
    if (query == _lastQuery) return;
    _lastQuery = query;
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final bloc = context.read<BookBloc>();
      if (query.isEmpty) {
        bloc.add(LoadBooks());
      } else {
        bloc.add(SearchBooks(query));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: TextField(
        onChanged: _onChanged,
        decoration: InputDecoration(
          hintText: 'Search book...',
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear_rounded),
            onPressed: () {
              _debounce?.cancel();
              _lastQuery = '';
              context.read<BookBloc>().add(LoadBooks());
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ),
    );
  }
}