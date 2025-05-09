import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';

class CartTotalWidget extends StatelessWidget {
  const CartTotalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final totalPrice = context.watch<BookProvider>().totalPrice;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 0, 255, 0.1), // Альтернативный способ для withOpacity
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('\$${totalPrice.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}