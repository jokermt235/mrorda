import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'cart_bloc.dart';
import 'book.dart';

class CartViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: BlocBuilder<CartBloc, Map<Book, int>>(
        builder: (context, cart) {
          if (cart.isEmpty) {
            return Center(child: Text('Your cart is empty.'));
          }

          final totalPrice = cart.entries.fold<double>(
            0,
            (sum, entry) => sum + (entry.key.price * entry.value),
          );

          return Column(
            children: [
              Expanded(
                child: ListView(
                  children:
                      cart.entries.map((entry) {
                        final book = entry.key;
                        final quantity = entry.value;
                        return ListTile(
                          leading:
                              book.coverUrl.isNotEmpty
                                  ? Image.network(
                                    book.coverUrl,
                                    width: 50,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  )
                                  : Icon(Icons.book),
                          title: Text(book.title),
                          subtitle: Text(
                            'Pages: ${book.pages} | \$${book.price} x $quantity',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  context.read<CartBloc>().decreaseBook(book);
                                },
                              ),
                              Text('$quantity'),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  context.read<CartBloc>().addBook(book);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  context.read<CartBloc>().removeBook(book);
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
