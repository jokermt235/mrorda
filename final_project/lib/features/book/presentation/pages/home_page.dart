import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../book_bloc/book_bloc.dart';
import 'components/search_bar.dart';
import 'components/book_grid.dart';
import 'components/category_filter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Store'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.go('/cart'),
          ),
        ],
      ),
      body: Column(
        children: [
          const SearchBar(),
          const CategoryFilter(),
          Expanded(child: BookGrid()),
        ],
      ),
    );
  }
}