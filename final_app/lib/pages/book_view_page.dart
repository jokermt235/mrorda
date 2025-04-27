import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/book_bloc.dart';
import '../bloc/cart_bloc.dart';
import '../models/book.dart';
import 'package:go_router/go_router.dart';

class BookViewPage extends StatelessWidget {
  final String id;

  const BookViewPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final book = context.read<BookCubit>().state.books.firstWhere((b) => b.id == id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: Image.network(book.imageUrl)),
            const SizedBox(height: 10),
            Text(book.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text('Author: ${book.author}'),
            const SizedBox(height: 5),
            Text('Pages: ${book.pages}'),
            const SizedBox(height: 5),
            Text('Category: ${book.category}'),
            const SizedBox(height: 5),
            Text('\$${book.price}', style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<CartCubit>().addToCart(book);
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
