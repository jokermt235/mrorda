// lib/services/book_service.dart

import 'package:final_booksaleapp/models/book.dart';

class BookService {
  // In a real app, this would fetch data from a network API or local database
  Future<List<Book>> getBooks() async {
    // Simulate fetching books with a slight delay
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      Book(
        id: '1',
        title: 'The Hitchhiker\'s Guide to the Galaxy',
        author: 'Douglas Adams',
        price: 9.99,
        pages: 224,
        coverImageUrl: 'https://m.media-amazon.com/images/I/81wrttWC3xL._AC_UF1000,1000_QL80_.jpg',
        category: 'Science Fiction',
      ),
      Book(
        id: '2',
        title: 'Pride and Prejudice',
        author: 'Jane Austen',
        price: 7.50,
        pages: 432,
        coverImageUrl: 'https://m.media-amazon.com/images/I/71Q1K6u11YL._AC_UF1000,1000_QL80_.jpg',
        category: 'Romance',
      ),
      Book(
        id: '3',
        title: '1984',
        author: 'George Orwell',
        price: 8.25,
        pages: 328,
        coverImageUrl: 'https://m.media-amazon.com/images/I/71hF-913xuL._AC_UF1000,1000_QL80_.jpg',
        category: 'Dystopian',
      ),
      Book(
        id: '4',
        title: 'To Kill a Mockingbird',
        author: 'Harper Lee',
        price: 10.50,
        pages: 281,
        coverImageUrl: 'https://m.media-amazon.com/images/I/51h9xYRj8YL._AC_UF1000,1000_QL80_.jpg',
        category: 'Fiction',
      ),
      Book(
        id: '5',
        title: 'The Lord of the Rings',
        author: 'J.R.R. Tolkien',
        price: 15.00,
        pages: 1216,
        coverImageUrl: 'https://m.media-amazon.com/images/I/712aGx-Q-qL._AC_UF1000,1000_QL80_.jpg',
        category: 'Fantasy',
      ),
      Book(
        id: '6',
        title: 'The Great Gatsby',
        author: 'F. Scott Fitzgerald',
        price: 9.00,
        pages: 180,
        coverImageUrl: 'https://m.media-amazon.com/images/I/71FTb9l9loL._AC_UF1000,1000_QL80_.jpg',
        category: 'Fiction',
      ),
      // Add more books here as needed
    ];
  }
}