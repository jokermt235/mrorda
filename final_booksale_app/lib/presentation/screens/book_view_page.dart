// lib/presentation/screens/book_view_page.dart
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_booksale_app/models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksale_app/bloc/book_bloc.dart';
import 'package:final_booksale_app/bloc/cart_bloc.dart';
import 'package:final_booksale_app/models/cart_item.dart';

class BookViewPage extends StatelessWidget {
  final String bookId;

  const BookViewPage({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    final bookState = context.watch<BookBloc>().state;
    Book? book;
    if (bookState is BookLoaded) {
      book = bookState.books.firstWhere((b) => b.id == bookId);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(book?.title ?? 'Book Details'),
      ),
      body: book == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      height: 200,
                      width: 150,
                      child: CachedNetworkImage(
                        imageUrl: book?.coverImageUrl ?? '',
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Title: ${book?.title ?? ''}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Author: ${book?.author ?? ''}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 8),
                  Text('Price: \$${book?.price.toStringAsFixed(2) ?? '0.00'}', style: const TextStyle(fontSize: 18, color: Colors.green)),
                  const SizedBox(height: 8),
                  Text('Pages: ${book?.pages ?? ''}', style: const TextStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  Text('Category: ${book?.category ?? ''}', style: const TextStyle(fontSize: 14, color: Colors.blue)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Description: ${book?.title ?? ''}'),
                                content: SingleChildScrollView(
                                  child: Text(book?.description ?? 'No description available.'),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('View Sample'),
                      ),
                      BlocBuilder<CartBloc, CartState>(
                        builder: (context, state) {
                          final existingCartItem = state.items.firstWhere(
                            (item) => item.book.id == book?.id,
                            orElse: () => CartItem(book: Book(id: '', title: '', author: '', coverImageUrl: '', price: 0.0, pages: 0, category: ''), quantity: 0),
                          );
                          return Text('In Cart: ${existingCartItem.quantity > 0 ? existingCartItem.quantity : 0}');
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (book != null) {
                        context.read<CartBloc>().add(AddToCart(book));
                      }
                    },
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            ),
    );
  }
}