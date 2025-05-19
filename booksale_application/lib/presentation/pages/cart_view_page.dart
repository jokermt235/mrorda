import 'package:booksale_application/data/models/cart_item_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../presentation/bloc/cart/cart_bloc.dart';

class CartViewPage extends StatelessWidget {
  const CartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return CartItemTile(item: item);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total:',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '\$${state.totalPrice.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Checkout'),
                      ),
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

class CartItemTile extends StatelessWidget {
  final CartItemModel item;
  const CartItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: item.book.coverUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(item.book.title),
        subtitle: Text('\$${item.book.price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (item.quantity > 1) {
                  context.read<CartBloc>().add(
                    UpdateQuantity(item.book, item.quantity - 1),
                  );
                } else {
                  context.read<CartBloc>().add(RemoveFromCart(item.book));
                }
              },
            ),
            Text(item.quantity.toString()),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => context.read<CartBloc>().add(
                UpdateQuantity(item.book, item.quantity + 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}