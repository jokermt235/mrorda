import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../models/book.dart';
import '../blocs/cart_bloc/cart_bloc.dart';
import '../blocs/cart_bloc/cart_event.dart';
import '../blocs/cart_bloc/cart_state.dart';

class BookViewPage extends StatelessWidget {
  final Book book;

  const BookViewPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(book.title),
        backgroundColor: Colors.deepPurple[300],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'book_cover_${book.id}',
                child: Image.network(
                  book.coverUrl,
                  height: 300,
                  fit: BoxFit.contain,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const SizedBox(
                      height: 300,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 300,
                      child: Center(child: Icon(Icons.broken_image, size: 50)),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'by ${book.author}',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Text(
              'Category: ${book.category}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Pages: ${book.pages}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Price: \$${book.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.green[800],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                int quantityInCart = 0;
                if (state is CartLoaded) {
                  quantityInCart = state.getQuantityForBook(book.id);
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline),
                      iconSize: 30,
                      color: quantityInCart > 0 ? Colors.red : Colors.grey,
                      onPressed:
                          quantityInCart > 0
                              ? () {
                                context.read<CartBloc>().add(
                                  DecreaseBookQuantity(book.id),
                                );
                              }
                              : null,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      '$quantityInCart in cart',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: const Icon(Icons.add_circle),
                      iconSize: 30,
                      color: Colors.green,
                      onPressed: () {
                        context.read<CartBloc>().add(AddBookToCart(book));
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
