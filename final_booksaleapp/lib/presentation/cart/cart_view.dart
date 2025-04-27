import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksaleapp/blocs/cart/cart_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            return const Center(child: Text('Your cart is empty.'));
          } else if (state is CartLoaded) {
            if (state.cartItems.isEmpty) {
              return const Center(child: Text('Your cart is empty.'));
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = state.cartItems[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 80,
                                height: 120,
                                child: Image.network(
                                  cartItem.book.coverImageUrl,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.book, size: 40),
                                ),
                              ),
                              const SizedBox(width: 16.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cartItem.book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                    Text('Author: ${cartItem.book.author}'),
                                    Text('Price: \$${cartItem.book.price.toStringAsFixed(2)}'),
                                    Row(
                                      children: [
                                        const Text('Quantity:'),
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () => context.read<CartBloc>().add(DecreaseQuantity(book: cartItem.book)),
                                        ),
                                        Text('${cartItem.quantity}'),
                                        IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () => context.read<CartBloc>().add(IncreaseQuantity(book: cartItem.book)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => context.read<CartBloc>().add(RemoveFromCart(book: cartItem.book)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Total Items: ${state.totalItems}', style: const TextStyle(fontSize: 16)),
                      Text('Total Price: \$${state.totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          // Implement checkout logic here
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Checkout functionality will be implemented here.')),
                          );
                        },
                        child: const Text('Proceed to Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else if (state is CartError) {
            return Center(child: Text('Error loading cart: ${state.message}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}