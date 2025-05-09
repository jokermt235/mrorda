import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book_model.dart';
import '../providers/cart_provider.dart';

class ViewBookPage extends StatelessWidget {
  final Book book;

  const ViewBookPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text('In Cart: ${cartProvider.totalItems}'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 150,
                height: 200,
                color: Colors.grey.shade300,
                child: const Icon(Icons.book, size: 80),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Category: ${book.category}'),
            const SizedBox(height: 8),
            Text('Price: \$${book.price.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text('Pages: ${book.pages}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                cartProvider.addToCart(book);
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}