import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:book_sales/core/models/book.dart';
import 'package:book_sales/features/cart/bloc/cart_bloc.dart';
import 'package:book_sales/features/cart/bloc/cart_event.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;
  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(book.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 8,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Text(
                      book.title,
                      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Author: ${book.author}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Category: ${book.category}',
                      style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Pages: ${book.totalPages}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Divider(height: 32, thickness: 1),
                    Text(
                      book.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<CartBloc>().add(AddBookToCart(book));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('«${book.title}» added to cart')),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                      label: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}