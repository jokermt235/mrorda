import 'package:flutter/material.dart';
import '../models/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';

class BookViewPage extends StatelessWidget {
  const BookViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Book book = Book(
      id: "1",
      title: "Flutter for Beginners",
      category: "Programming",
      imageUrl: "assets/images/flutter_for_beginners.png",
      pages: 250,
      price: 29.99,
    );

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Column(
        children: [
          // Используем Image.asset для локальных изображений
          Image.asset(book.imageUrl, height: 200),
          Text("Category: ${book.category}"),
          Text("Pages: ${book.pages}"),
          Text("Price: \$${book.price}"),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final count = state.items[book] ?? 0;
              return Column(
                children: [
                  Text("In Cart: $count"),
                  ElevatedButton(
                    onPressed: () => context.read<CartCubit>().addBook(book),
                    child: Text("Add to Cart"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
