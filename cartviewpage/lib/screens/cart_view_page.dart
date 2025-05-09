import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/cart_total_widget.dart';

class CartViewPage extends StatelessWidget {
  const CartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final books = context.watch<BookProvider>().books;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: books.length,
              itemBuilder: (context, index) {
                return CartItemWidget(book: books[index]);
              },
            ),
          ),
          const CartTotalWidget(),
        ],
      ),
    );
  }
}