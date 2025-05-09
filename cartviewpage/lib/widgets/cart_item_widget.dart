import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';

class CartItemWidget extends StatelessWidget {
  final Book book;

  const CartItemWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final bookProvider = context.read<BookProvider>();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(book.title, style: const TextStyle(fontSize: 16)),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    bookProvider.removeBook(book.id);
                  },
                ),
                Text('${book.quantity}', style: const TextStyle(fontSize: 16)),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    bookProvider.addBook(book.id);
                  },
                ),
              ],
            ),
            Text('\$${(book.price * book.quantity).toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}