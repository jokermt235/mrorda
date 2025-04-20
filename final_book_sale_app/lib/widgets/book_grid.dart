import 'package:flutter/material.dart';
import 'book_item.dart';
import '../models/book_model.dart';

class BookGrid extends StatelessWidget {
  final List<Book> books = [
    Book(
      id: "1",
      title: "Flutter for Beginners",
      category: "Programming",
      imageUrl: "assets/images/flutter_for_beginners.png",
      pages: 250,
      price: 29.99,
    ),
    Book(
      id: "2",
      title: "1047 reasons to smile",
      category: "Programming",
      imageUrl: "assets/images/1047_reasons_to_smile.png",
      pages: 300,
      price: 24.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(12),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250, // Высота каждой ячейки в гриде
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: books.length,
      itemBuilder: (_, index) => BookItem(book: books[index]),
    );
  }
}
