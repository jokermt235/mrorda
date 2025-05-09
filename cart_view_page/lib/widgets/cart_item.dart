import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';

class CartItem extends StatelessWidget {
  final Book book;

  const CartItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      key: ValueKey(book.id),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        title: Text(book.title),
        subtitle: Text('\$${book.price} x ${book.quantity}'),
        trailing: SizedBox(
          width: 120,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  Provider.of<BookProvider>(context, listen: false)
                      .updateQuantity(book, book.quantity - 1);
                },
              ),
              Text('${book.quantity}'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  Provider.of<BookProvider>(context, listen: false)
                      .updateQuantity(book, book.quantity + 1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}