import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/book_grid.dart';
import '../widgets/category_chooser.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Store")),
      body: Column(
        children: [
          SearchBarWidget(),
          CategoryChooser(),
          Expanded(child: BookGrid()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/cart'),
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
