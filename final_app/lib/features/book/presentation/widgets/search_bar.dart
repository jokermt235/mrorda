import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/book/bloc/book_bloc.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Update the SearchBarWidget
return Padding(
  padding: const EdgeInsets.all(12.0),
  child: TextField(
    decoration: InputDecoration(
      hintText: 'Search books...',
      prefixIcon: const Icon(Icons.search),
      filled: true,
      fillColor: Colors.brown.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 0, 
        horizontal: 20,
      ),
    ),
    onChanged: (query) {
      context.read<BookBloc>().add(SearchBooks(query: query));
    },
  ),
);
  }
}