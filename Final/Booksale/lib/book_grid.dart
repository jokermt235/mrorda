import 'package:flutter/material.dart';
import 'book.dart'; // твой Book класс

class BookGridPage extends StatefulWidget {
  final List<Book> books;

  const BookGridPage({Key? key, required this.books}) : super(key: key);

  @override
  _BookGridPageState createState() => _BookGridPageState();
}

class _BookGridPageState extends State<BookGridPage> {
  String? selectedCategory;

  List<String> get categories {
    return widget.books.map((book) => book.category).toSet().toList();
  }

  List<Book> get filteredBooks {
    if (selectedCategory == null) {
      return widget.books;
    } else {
      return widget.books
          .where((book) => book.category == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 🔥 ВЫПАДАЮЩИЙ СПИСОК КАТЕГОРИЙ
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<String>(
            value: selectedCategory,
            hint: const Text("Select Category"),
            isExpanded: true,
            items:
                categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList()
                  ..insert(
                    0,
                    const DropdownMenuItem(
                      value: null,
                      child: Text("All Categories"),
                    ),
                  ),
            onChanged: (value) {
              setState(() {
                selectedCategory = value;
              });
            },
          ),
        ),

        // 🔥 СЕТКА КНИГ
        Expanded(child: BookGrid(books: filteredBooks)),
      ],
    );
  }
}

// Переносим сюда твой BookGrid без изменений
class BookGrid extends StatelessWidget {
  final List<Book> books;

  const BookGrid({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return const Center(child: Text("No books available."));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.7,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: Center(
                      child: Text(book.title, textAlign: TextAlign.center),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Category: ${book.category}',
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  'Price: \$${book.price}',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
