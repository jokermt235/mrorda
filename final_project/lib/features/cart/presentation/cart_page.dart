import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cart_bloc/cart_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final total = state.items.fold(
              0.0,
              (sum, item) => sum + (item.book.price * item.quantity),
            );

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (_, index) {
                      final item = state.items[index];
                      return ListTile(
                        leading: Image.network(item.book.coverUrl, width: 50),
                        title: Text(item.book.title),
                        subtitle: Text('\$${item.book.price} x ${item.quantity}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () => context
                                  .read<CartBloc>()
                                  .add(RemoveFromCart(item.book)),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () => context
                                  .read<CartBloc>()
                                  .add(AddToCart(item.book)),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${total.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}