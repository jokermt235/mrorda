import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';
import '../blocs/cart/cart_state.dart';
import '../models/book_model.dart';

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
          final cartItems = state.cartItems;

          if (cartItems.isEmpty) {
            return const Center(child: Text('Cart is empty.'));
          }

          final groupedBooks = <Book, int>{};

          for (final book in cartItems) {
            groupedBooks.update(book, (count) => count + 1, ifAbsent: () => 1);
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: groupedBooks.length,
                  itemBuilder: (context, index) {
                    final book = groupedBooks.keys.elementAt(index);
                    final quantity = groupedBooks[book] ?? 0;

                    return ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(book.title),
                      subtitle: Text('Quantity: $quantity'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              context.read<CartBloc>().add(DecreaseBookQuantity(book));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              context.read<CartBloc>().add(IncreaseBookQuantity(book));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              context.read<CartBloc>().add(RemoveFromCart(book));
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Total: \$${state.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Checkout not implemented yet!')),
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart/cart_bloc.dart';
import '../blocs/cart/cart_event.dart';
import '../blocs/cart/cart_state.dart';
import '../models/book_model.dart';

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
          if (state.cartItems.isEmpty) {
            return const Center(child: Text('Cart is empty.'));
          }

          final groupedBooks = state.cartItems.fold(
            <Book, int>{},
            (map, book) => map.update(book, (count) => count + 1, ifAbsent: () => 1),
          );

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: groupedBooks.length,
                  itemBuilder: (context, index) {
                    final book = groupedBooks.keys.elementAt(index);
                    final quantity = groupedBooks[book] ?? 0;

                    return ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(book.title),
                      subtitle: Text('Quantity: $quantity'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              context.read<CartBloc>().add(DecreaseBookQuantity(book));
                            },
                          ),
                          Text(' $quantity '),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              context.read<CartBloc>().add(IncreaseBookQuantity(book));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              context.read<CartBloc>().add(RemoveFromCart(book));
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Total: \$${state.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Checkout not implemented yet!')),
                        );
                      },
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
```