// lib/presentation/screens/cart_view_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksale_app/bloc/cart_bloc.dart'; // Import your CartBloc
import 'package:final_booksale_app/models/book_model.dart'; // Import your Book model
import 'package:final_booksale_app/models/cart_item.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartViewPage extends StatelessWidget {
  const CartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final cartItems = state.items;
            final totalPrice = state.totalPrice;

            return cartItems.isEmpty
                ? const Center(
                    child: Text('Your cart is empty.'),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) {
                            final cartItem = cartItems[index];
                            final book = cartItem.book;
                            final quantity = cartItem.quantity;

                            return Card(
                              margin: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 80,
                                      height: 100,
                                      child: CachedNetworkImage(
                                        imageUrl: book.coverImageUrl,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                        errorWidget: (context, url, error) => const Icon(Icons.error),
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                          Text('Price: \$${book.price.toStringAsFixed(2)}'),
                                          Row(
                                            children: [
                                              const Text('Quantity: '),
                                              IconButton(
                                                icon: const Icon(Icons.remove),
                                                onPressed: () {
                                                  context.read<CartBloc>().add(UpdateQuantity(book, quantity - 1));
                                                },
                                              ),
                                              Text('$quantity'),
                                              IconButton(
                                                icon: const Icon(Icons.add),
                                                onPressed: () {
                                                  context.read<CartBloc>().add(UpdateQuantity(book, quantity + 1));
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        context.read<CartBloc>().add(RemoveFromCart(book));
                                      },
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Text('\$${totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement checkout logic
                          },
                          child: const Text('Checkout'),
                        ),
                      ),
                    ],
                  );
          } else if (state is CartError) {
            return Center(child: Text('Error loading cart: ${state.message}'));
          } else {
            return const Center(child: Text('Something went wrong with the cart.'));
          }
        },
      ),
    );
  }
}