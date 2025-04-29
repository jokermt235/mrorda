import 'package:finals_project/features/shared/domain/presentation/blocs/book_bloc.dart';
import 'package:finals_project/features/shared/domain/presentation/blocs/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookViewPage extends StatelessWidget {
  final String bookId;

  const BookViewPage({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    // Получение книги по ID из состояния
    final book = context.read<BookBloc>().state.books.firstWhere(
      (b) => b.id == bookId,
    );

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Column(
        children: [
          Image.network(book.coverUrl),
          Text('Price: \$${book.price}'),
          Text('Pages: ${book.pageCount}'),
          Text('Category: ${book.category}'),
          ElevatedButton(
            onPressed: () {
              context.read<CartBloc>().add(AddToCart(book));
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
