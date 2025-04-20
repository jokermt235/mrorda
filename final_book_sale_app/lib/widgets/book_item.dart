import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';

class BookItem extends StatelessWidget {
  final Book book;

  const BookItem({required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/book'),
      child: Card(
        child: Column(
          children: [
            Image.network(book.imageUrl, height: 100, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(book.title, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text("\$${book.price}"),
            ElevatedButton(
              onPressed: () => context.read<CartCubit>().addBook(book),
              child: Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
