import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc/cart_bloc.dart';
import '../widgets/cart_item.dart';

class CartViewPage extends StatelessWidget {
  const CartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          } else if (state is CartLoaded) {
            if (state.cartItems.isEmpty) {
              return const Center(
                child: Text('Your cart is empty'),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = state.cartItems[index];
                      return CartItemWidget(
                        item: item,
                        onIncrease: () {
                          context
                              .read<CartBloc>()
                              .add(AddToCart(book: item.book));
                        },
                        onDecrease: () {
                          context
                              .read<CartBloc>()
                              .add(DecreaseQuantity(bookId: item.book.id));
                        },
                        onRemove: () {
                          context
                              .read<CartBloc>()
                              .add(RemoveFromCart(bookId: item.book.id));
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: \$${state.totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // In a real app, this would proceed to checkout
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Proceeding to checkout...'),
                            ),
                          );
                        },
                        child: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}