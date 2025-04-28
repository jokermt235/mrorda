import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../blocs/cart_bloc.dart';
import '../models/book.dart';

class CartViewPage extends StatelessWidget {
  const CartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();

    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     context.pop();
        //   },
        // ),
        title: const Text('Your Cart'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.go('/');
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.go('/cart');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CartBloc, List<Book>>(
                builder: (context, cart) {
                  if (cart.isEmpty) {
                    return const Center(child: Text('Your cart is empty.'));
                  }
                  return ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final book = cart[index];
                      return Card(
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              book.coverUrl,
                              width: 50,
                              height: 70,
                              fit: BoxFit.contain,
                              alignment: Alignment.center,
                            ),
                          ),
                          title: Text(book.title),
                          subtitle: Text('\$${book.price.toStringAsFixed(2)}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () {
                              cartBloc.removeFromCart(book);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Book removed from cart!',
                                  ),
                                  backgroundColor: Colors.redAccent,
                                  duration: const Duration(seconds: 2),
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // общая стоимость
            BlocBuilder<CartBloc, List<Book>>(
              builder: (context, cart) {
                final total = cartBloc.totalPrice;
                return Text(
                  'Total: \$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
