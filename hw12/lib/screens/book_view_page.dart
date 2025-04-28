import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/book/book_bloc.dart';
import '../blocs/cart/cart_bloc.dart';

class BookViewPage extends StatelessWidget {
  final String bookId;

  const BookViewPage({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
        automaticallyImplyLeading: true,
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoaded) {
            final book = state.books.firstWhere((b) => b.id == bookId);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookCoverPage(imagePath: book.coverUrl),
                        ),
                      );
                    },
                    child: Hero(
                      tag: book.coverUrl,
                      child: Image.asset(book.coverUrl, height: 200),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(book.title, style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 10),
                  Text('Category: ${book.category}'),
                  const SizedBox(height: 10),
                  Text('Pages: ${book.pages}'),
                  const SizedBox(height: 10),
                  Text('Price: \$${book.price}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CartBloc>().add(AddToCart(book));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to cart')),
                      );
                    },
                    child: const Text('Add to Cart'),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class BookCoverPage extends StatelessWidget {
  final String imagePath;

  const BookCoverPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Hero(
          tag: imagePath,
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
