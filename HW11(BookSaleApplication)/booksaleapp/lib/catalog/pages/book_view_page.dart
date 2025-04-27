import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksaleapp/data/models/book.dart';
import 'package:booksaleapp/bloc/cart/cart_bloc.dart';
import 'package:booksaleapp/bloc/cart/cart_event.dart';

class BookViewPage extends StatelessWidget {
  final Book book;
  const BookViewPage({required this.book, super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: book.totalPages,
      child: Scaffold(
        appBar: AppBar(
          title: Text(book.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {
                context.read<CartBloc>().add(AddToCart(book));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('«${book.title}» добавлена в корзину')),
                );
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
              book.totalPages,
              (i) => Tab(text: '${i + 1}'),
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(book.totalPages, (i) {
            final content = book.pagesContent[i];
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (i == 0) ...[
                      Text(book.description, style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 16),
                    ],
                    Text(
                      content.isNotEmpty ? content : 'Страница ${i + 1} пуста.',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
