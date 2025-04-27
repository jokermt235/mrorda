import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../catalog/widgets/book_list.dart';
import '../../catalog/widgets/search_bar.dart';
import '../../catalog/widgets/category_filter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library Sale'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              GoRouter.of(context).push('/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: const [
          BookSearchBar(),
          CategoryFilter(),
          Expanded(child: BookList()),
        ],
      ),
    );
  }
}