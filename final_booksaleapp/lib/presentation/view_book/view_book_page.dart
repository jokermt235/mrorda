import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksaleapp/blocs/view_book/view_book_bloc.dart';
import 'package:final_booksaleapp/blocs/cart/cart_bloc.dart';
import 'package:final_booksaleapp/services/book_service.dart';

class ViewBookPage extends StatelessWidget {
  final String? bookId;

  const ViewBookPage({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewBookBloc(bookService: BookService())..add(LoadBookDetails(bookId: bookId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Details'),
        ),
        body: BlocBuilder<ViewBookBloc, ViewBookState>(
          builder: (context, state) {
            if (state is ViewBookLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ViewBookLoaded) {
              final book = state.book;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                        height: 200,
                        child: Image.network(
                          book.coverImageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.book, size: 80),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(book.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text('Author: ${book.author}', style: const TextStyle(fontSize: 16)),
                    Text('Price: \$${book.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
                    Text('Pages: ${book.pages}', style: const TextStyle(fontSize: 16)),
                    Text('Category: ${book.category}', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 24.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<CartBloc>().add(AddToCart(book: book));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${book.title} added to cart!')),
                            );
                          },
                          child: const Text('Add to Cart'),
                        ),
                        // You might want to display the count in the cart here in a more sophisticated way
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is ViewBookError) {
              return Center(child: Text('Error loading book details: ${state.message}'));
            }
            return const Center(child: Text('Select a book to view details.'));
          },
        ),
      ),
    );
  }
}