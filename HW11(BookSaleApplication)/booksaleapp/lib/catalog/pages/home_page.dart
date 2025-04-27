import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:booksaleapp/catalog/widgets/book_search_bar.dart';
import 'package:booksaleapp/catalog/widgets/category_chooser.dart';
import 'package:booksaleapp/catalog/widgets/book_grid.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => GoRouter.of(context).go('/cart'),
          ),
        ],
      ),
      body: Column(
      children: [
        const BookSearchBar(),
        const CategoryChooser(),
        const Expanded(child: BookGrid()),
      ],
      
      ),

    );
  }
}