import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/book.dart';
import '../../blocs/book/book_bloc.dart';
import '../../blocs/cart/cart_bloc.dart';

class BookViewPage extends StatelessWidget {
  final String bookId;

  const BookViewPage({required this.bookId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Details')),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoaded) {
            final book = state.books.firstWhere((b) => b.id == bookId);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(book.coverUrl, height: 200),
                  ),
                  const SizedBox(height: 16),
                  Text(book.title, style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  Text('Category: ${book.category}'),
                  Text('Pages: ${book.pageCount}'),
                  Text('Price: ${book.price} \$', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, cartState) {
                      int count = 0;
                      if (cartState is CartUpdated) {
                        count = cartState.cart[book.id] ?? 0;
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              context.read<CartBloc>().add(AddToCart(book.id));
                            },
                            child: const Text('Add to Cart'),
                          ),
                          Text('In Cart: $count'),
                        ],
                      );
                    },
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
