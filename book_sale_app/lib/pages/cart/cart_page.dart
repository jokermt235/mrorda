import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/cart/cart_bloc.dart';
import '../../blocs/book/book_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, cartState) {
          return BlocBuilder<BookBloc, BookState>(
            builder: (context, bookState) {
              if (cartState is CartUpdated && bookState is BookLoaded) {
                final cart = cartState.cart;
                final books = bookState.books;
                double totalPrice = 0;

                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    ...cart.entries.map((entry) {
                      final book = books.firstWhere((b) => b.id == entry.key);
                      final count = entry.value;
                      totalPrice += book.price * count;

                      return Card(
                        child: ListTile(
                          title: Text(book.title),
                          subtitle: Text('Count: $count'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                // icon: const Icon(Icons.remove),
                                icon: Image.network('https://cdn-icons-png.flaticon.com/512/61/61138.png'),
                                onPressed: () {
                                  context.read<CartBloc>().add(DecreaseCartItem(book.id));
                                },
                              ),
                              IconButton(
                                // icon: const Icon(Icons.add),
                                icon: Image.network('https://static.thenounproject.com/png/1649999-200.png'),
                                onPressed: () {
                                  context.read<CartBloc>().add(AddToCart(book.id));
                                },
                              ),
                              IconButton(
                                // icon: const Icon(Icons.delete),
                                icon: Image.network('https://cdn-icons-png.flaticon.com/512/3334/3334328.png'),
                                onPressed: () {
                                  context.read<CartBloc>().add(RemoveFromCart(book.id));
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 20),
                    Text('Total: ${totalPrice.toStringAsFixed(2)} \$', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                );
              } else {
                return const Center(child: Text('Cart is empty.'));
              }
            },
          );
        },
      ),
    );
  }
}
