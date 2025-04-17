// lib/book_list_screen.dart
import 'package:flutter/material.dart';
import 'models/book.dart';
import 'open_book_screen.dart';  // Import the OpenBookScreen here

class BookListScreen extends StatelessWidget {
  // List of books
  final List<Book> books = [
    Book(
      title: 'Book 1',
      author: 'Author 1',
      description: 'This is a description of Book 1.',
      pages: ['Page 1 content', 'Page 2 content', 'Page 3 content'],
    ),
    Book(
      title: 'Book 2',
      author: 'Author 2',
      description: 'This is a description of Book 2.',
      pages: ['Page 1 content', 'Page 2 content'],
    ),
    Book(
      title: 'Book 3',
      author: 'Author 3',
      description: 'This is a description of Book 3.',
      pages: ['Page 1 content', 'Page 2 content', 'Page 3 content'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Library'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  // Number of columns
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          childAspectRatio: 0.7, // Card proportions
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              // Navigate to OpenBookScreen when the book is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OpenBookScreen(book: book),
                ),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    color: Colors.blueGrey,
                    child: Center(
                      child: Text(
                        book.title,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      book.description,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
