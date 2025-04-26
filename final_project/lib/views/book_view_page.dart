import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service_locator.dart';
import '../services/book_service.dart';
import '../bloc/cart_bloc.dart';

class BookViewPage extends StatelessWidget {
  final String bookId;
  const BookViewPage({required this.bookId, super.key});

  @override
  Widget build(BuildContext context) {
    final book = sl<BookService>().getBookById(bookId);
    if (book == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text("Book not found", style: TextStyle(color: Colors.white))),
      );
    }
    final cartBloc = context.read<CartBloc>();
    final cartState = cartBloc.state;
    final countInCart = cartState.cart[bookId] ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(child: Image.network(book.coverUrl, height: 200)),
            const SizedBox(height: 16),
            Text(book.title, style: const TextStyle(fontSize: 24, color: Colors.white)),
            Text('by ${book.author}', style: const TextStyle(fontSize: 16, color: Colors.white70)),
            const SizedBox(height: 12),
            Text('Category: ${book.category}', style: const TextStyle(color: Colors.white60)),
            Text('Pages: ${book.pages}', style: const TextStyle(color: Colors.white60)),
            Text('Price: \$${book.price}', style: const TextStyle(color: Colors.deepPurpleAccent, fontSize: 18)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (countInCart > 0)
                  IconButton(
                    icon: const Icon(Icons.remove, color: Colors.white),
                    onPressed: () => cartBloc.add(DecreaseCount(book.id)),
                  ),
                Text('$countInCart in cart', style: const TextStyle(color: Colors.deepPurpleAccent)),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                  onPressed: () => cartBloc.add(AddToCart(book.id)),
                ),
              ],
            ),
            // Placeholder for book pages preview
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(12),
              color: Colors.grey[850],
              child: const Text(
                "Preview pages (Not implemented)",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}