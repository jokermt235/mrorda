import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../models/book.dart';
import '../blocs/cart_bloc.dart';

class BookViewPage extends StatelessWidget {
  final Book book;

  const BookViewPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.go('/');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.go('/cart');
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Картинка слева (увеличенная)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  book.coverUrl,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  height: 400, // <-- увеличиваем высоту
                ),
              ),
              const SizedBox(width: 32), // Отступ между книгой и текстом
              // Описание справа (с ограниченной шириной)
              SizedBox(
                width: 350, // <-- задаём фиксированную ширину описания
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      book.title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Category: ${book.category}',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${book.pages} pages',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${book.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      book.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        cartBloc.addToCart(book);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Book added to cart!'),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_shopping_cart),
                      label: const Text('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 241, 211, 101),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
