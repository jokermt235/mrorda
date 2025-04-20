import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';

class CartViewPage extends StatelessWidget {
  const CartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return Center(child: Text("Cart is empty"));
          }
          return ListView(
            children: state.items.entries.map((entry) {
              final book = entry.key;
              final count = entry.value;
              return ListTile(
                title: Text(book.title),
                subtitle: Text("Count: $count"),
                trailing: Text("\$${(book.price * count).toStringAsFixed(2)}"),
              );
            }).toList(),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Total: \$${state.total.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 20)),
          );
        },
      ),
    );
  }
}
