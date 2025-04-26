import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/cart_bloc.dart';
import '../service_locator.dart';
import '../services/book_service.dart';

class CartViewPage extends StatelessWidget {
  const CartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.watch<CartBloc>();
    final cart = cartBloc.state.cart;
    final bookService = sl<BookService>();

    final books = cart.keys.map((id) => bookService.getBookById(id)).whereType<dynamic>().toList();

    double total = 0;
    for (var book in books) {
      total += (book.price * cart[book.id]!);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Your Cart")),
      body: cart.isEmpty
          ? const Center(child: Text("Cart is empty", style: TextStyle(color: Colors.white70)))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, idx) {
                      final book = books[idx];
                      final count = cart[book.id]!;
                      return ListTile(
                        leading: Image.network(book.coverUrl, width: 40, height: 60),
                        title: Text(book.title, style: const TextStyle(color: Colors.white)),
                        subtitle: Text('${book.author}\n\$${book.price} x $count', style: const TextStyle(color: Colors.white60)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, color: Colors.white),
                              onPressed: () => cartBloc.add(DecreaseCount(book.id)),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, color: Colors.white),
                              onPressed: () => cartBloc.add(AddToCart(book.id)),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () => cartBloc.add(RemoveFromCart(book.id)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Total: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22, color: Colors.deepPurpleAccent)),
                ),
              ],
            ),
    );
  }
}