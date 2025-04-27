import 'package:flutter/material.dart';
import '../models/book.dart';

class BookGrid extends StatelessWidget {
  final List<Book> books;
  final Function(Book) onBookTap;

  const BookGrid({super.key, required this.books, required this.onBookTap});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Количество колонок
        childAspectRatio: 0.65, // Размер карточек
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return GestureDetector(
          onTap: () => onBookTap(book), // Обработчик для перехода на детальную страницу
          child: Card(
            elevation: 5,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Image.network(book.imageUrl, height: 150, fit: BoxFit.cover),
                const SizedBox(height: 10),
                Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text('\$${book.price}', style: const TextStyle(fontSize: 16, color: Colors.green)),
              ],
            ),
          ),
        );
      },
    );
  }
}
