import 'package:flutter/material.dart';
import '../widgets/search_bar.dart' as custom;
import '../widgets/book_grid.dart';
import '../widgets/category_chooser.dart';

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
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const custom.SearchBar(),
            const SizedBox(height: 16),
            const CategoryChooser(),
            const SizedBox(height: 16),
            Expanded(
              child: BookGrid(),
            ),
          ],
        ),
      ),
    );
  }
}