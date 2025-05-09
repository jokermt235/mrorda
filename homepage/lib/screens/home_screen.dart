import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/search_widget.dart';
import '../widgets/book_grid_widget.dart';
import '../widgets/category_widget.dart';
import '../models/book.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.watch<BookProvider>().books;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
      ),
      body: Column(
        children: [
          const SearchWidget(),
          const CategoryWidget(),
          Expanded(
            child: BookGridWidget(books: books),
          ),
        ],
      ),
    );
  }
}