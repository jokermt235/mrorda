import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/features/book/bloc/book_bloc.dart';
import '/features/book/data/models/book_model.dart';

class CartViewPage extends StatelessWidget {
  const CartViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoaded) {
            final cartItems = state.books.where((book) => book.quantity > 0);
            final total = cartItems.fold(
                0.0, (sum, book) => sum + (book.price * book.quantity));

            if (cartItems.isEmpty) {
              return const Center(child: Text('Your cart is empty'));
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final book = cartItems.elementAt(index);
                      // Update the ListTile in CartViewPage
return ListTile(
  leading: ClipRRect(
    borderRadius: BorderRadius.circular(8),
    child: Image.network(
      book.coverUrl,
      width: 50,
      height: 70,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => 
        Container(
          width: 50,
          height: 70,
          color: Colors.brown.shade100,
          child: const Icon(Icons.book, color: Colors.brown),
        ),
    ),
  ),
  title: Text(
    book.title,
    style: Theme.of(context).textTheme.titleMedium?.copyWith(
      color: Colors.brown.shade800,
    ),
  ),
  subtitle: Text(
    '\$${(book.price * book.quantity).toStringAsFixed(2)} (${book.quantity} x \$${book.price.toStringAsFixed(2)})',
    style: Theme.of(context).textTheme.bodySmall?.copyWith(
      color: Colors.brown.shade600,
    ),
  ),
  trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      IconButton(
        icon: Icon(Icons.remove, color: Colors.brown.shade600),
        onPressed: () => context.read<BookBloc>().add(
          DecreaseQuantity(bookId: book.id)),
      ),
      IconButton(
        icon: Icon(Icons.delete, color: Colors.brown.shade600),
        onPressed: () => context.read<BookBloc>().add(
          RemoveFromCart(bookId: book.id)),
      ),
    ],
  ),
);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${total.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement checkout
                    },
                    child: const Text('Checkout'),
                  ),
                ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}