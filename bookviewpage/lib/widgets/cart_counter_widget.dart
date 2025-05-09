import 'package:flutter/material.dart';

class CartCounterWidget extends StatefulWidget {
  final String bookId;

  const CartCounterWidget({super.key, required this.bookId});

  @override
  State<CartCounterWidget> createState() => _CartCounterWidgetState();
}

class _CartCounterWidgetState extends State<CartCounterWidget> {
  int count = 1;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: decrement,
        ),
        Text('$count'),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: increment,
        ),
      ],
    );
  }
}