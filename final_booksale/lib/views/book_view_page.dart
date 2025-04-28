import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/book_bloc.dart';
import '../bloc/cart_bloc.dart';
import '../models/book.dart';

class BookViewPage extends StatelessWidget {
  final String bookId;

  const BookViewPage({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, bookState) {
          if (bookState is! BookLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          final book = bookState.books.firstWhere(
            (b) => b.id == bookId,
            orElse:
                () => Book(
                  id: '0',
                  title: 'Book not found',
                  price: 0,
                  pages: 0,
                  category: '',
                  coverUrl: '',
                ),
          );

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Обложка книги
                if (book.coverUrl.isNotEmpty)
                  Image.network(book.coverUrl, height: 200)
                else
                  const Placeholder(fallbackHeight: 200, color: Colors.grey),

                const SizedBox(height: 20),
                Text(
                  book.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(height: 10),
                Text('Price: \$${book.price.toStringAsFixed(2)}'),

                const SizedBox(height: 10),
                Text('Pages: ${book.pages}'),

                const SizedBox(height: 10),
                Text('Category: ${book.category}'),

                const SizedBox(height: 20),
                // Управление корзиной
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, cartState) {
                    if (cartState is! CartLoaded) {
                      return const SizedBox.shrink();
                    }

                    final count = cartState.cart[book.id] ?? 0;

                    return Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed:
                              () => context.read<CartBloc>().add(
                                RemoveFromCart(book.id),
                              ),
                        ),
                        Text('$count', style: const TextStyle(fontSize: 18)),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed:
                              () => context.read<CartBloc>().add(
                                AddToCart(book.id),
                              ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
