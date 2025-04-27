import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'book_bloc.dart';
import 'book.dart';
import 'cart_bloc.dart';

class BookViewPage extends StatelessWidget {
  final String bookId;

  const BookViewPage({Key? key, required this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (state is BookError) {
          return Scaffold(body: Center(child: Text('Error: ${state.message}')));
        } else if (state is BookLoaded) {
          final book = state.books.firstWhere(
            (book) => book.id == bookId,
            orElse: () => throw Exception('Book not found'),
          );

          return Scaffold(
            appBar: AppBar(
              title: Text(book.title),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => context.go('/'),
              ),
              actions: [
                BlocBuilder<CartBloc, Map<Book, int>>(
                  builder: (context, cart) {
                    final totalItems = cart.values.fold(
                      0,
                      (sum, qty) => sum + qty,
                    );
                    return Stack(
                      children: [
                        IconButton(
                          icon: Icon(Icons.shopping_cart),
                          onPressed: () => context.go('/cart'),
                        ),
                        if (totalItems > 0)
                          Positioned(
                            right: 4,
                            top: 4,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.red,
                              child: Text(
                                '$totalItems',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child:
                        book.coverUrl.isNotEmpty
                            ? Image.network(book.coverUrl, height: 250)
                            : Icon(Icons.book, size: 100),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Price: \$${book.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Pages: ${book.pages}',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Text(
                    'Category: ${book.category}',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  if (book.samplePages.isNotEmpty) ...[
                    SizedBox(height: 24),
                    Text(
                      'Sample Pages',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: Center(
                        child: ListView.separated(
                          shrinkWrap: true, // <-- важно!
                          scrollDirection: Axis.horizontal,
                          itemCount: book.samplePages.length,
                          separatorBuilder: (context, _) => SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            return Image.network(
                              book.samplePages[index],
                              width: 150,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      Icon(Icons.error),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CartBloc>().addBook(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${book.title} added to cart!')),
                      );
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(body: Center(child: Text('No books available')));
        }
      },
    );
  }
}
