import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cartProvider.items.isEmpty
          ? const Center(
        child: Text('Cart is Empty'),
      )
          : ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) {
          var item = cartProvider.items[index];
          return ListTile(
            title: Text(item.book.title),
            subtitle: Text('Quantity: ${item.quantity}'),
            trailing: Text('\$${(item.book.price * item.quantity).toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}