import 'package:flutter/material.dart';
import 'dart:async';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Bookstore Example')),
        body: Center(
          child: Text('Welcome to the Bookstore!'),
        ),
      ),
    );
  }
}

class Book {
  final int id;
  final String title;
  final String author;

  Book(this.id, this.title, this.author);

  @override
  String toString() => 'Book ID: $id, Title: "$title", Author: $author';
}

class Bookstore {
  Future<List<Book>> fetchBooks() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      Book(1, 'The Hobbit', 'J.R.R. Tolkien'),
      Book(2, 'Dune', 'Frank Herbert'),
      Book(3, 'The Catcher in the Rye', 'J.D. Salinger'),
    ];
  }

  Future<Book> findBookById(int id) async {
    final books = await fetchBooks();
    await Future.delayed(Duration(seconds: 1));
    return books.firstWhere(
      (book) => book.id == id,
      orElse: () => throw Exception('No book found with ID $id'),
    );
  }
}

Future<int> computeSomething() async {
  return Future.delayed(Duration(seconds: 3), () => 77);
}

void main() {
  runApp(MyApp()); 

  final bookstore = Bookstore();

  bookstore.fetchBooks().then((books) {
    print('Successfully retrieved book collection:');
    for (var book in books) {
      print(' - $book');
    }
  }).catchError((e) {
    print('Error fetching books: $e');
  }).whenComplete(() {
    print('Book retrieval process finished.');
  });

  Future(() async {
    try {
      final book = await bookstore.findBookById(2);
      print('Book located: $book');
    } catch (e) {
      print('Oops! Something went wrong: $e');
    } finally {
      print('Book search operation completed.');
    }

    print('Initiating a background computation...');
    computeSomething().then((result) {
      print('Computation finished with result: $result');
    }).catchError((e) {
      print('Computation encountered an error: $e');
    });

    print('Meanwhile, the program continues running...');
  });
}
