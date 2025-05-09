import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});  // убрал `const`

  final List<Book> sampleBooks = [
    Book(id: '1', title: 'Book One', price: 10.0),
    Book(id: '2', title: 'Book Two', price: 15.0),
    Book(id: '3', title: 'Book Three', price: 20.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: sampleBooks.length,
        itemBuilder: (context, index) {
          final book = sampleBooks[index];
          return ListTile(
            key: ValueKey(book.id),
            title: Text(book.title),
            subtitle: Text('\$${book.price}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Provider.of<BookProvider>(context, listen: false).addBook(book);
              },
            ),
          );
        },
      ),
    );
  }
}