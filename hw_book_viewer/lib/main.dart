import 'package:flutter/material.dart';
import 'models/book.dart';

void main() {
  runApp(BookApp());
}

class BookApp extends StatelessWidget {
  final List<Book> books = [
    Book(
      title: 'Kyrgyzstan',
      author: 'Madina Toigonbaeva',
      pages: 120,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/1/1e/Flag_of_Kyrgyzstan.svg',
    ),
    Book(
      title: 'Mountains of Kyrgyzstan',
      author: 'Madina Toigonbaeva',
      pages: 160,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/e/eb/Tian_Shan_mountains_near_Almaty_2014.jpg',
    ),
    Book(
      title: 'Lakes and Valleys',
      author: 'Madina Toigonbaeva',
      pages: 95,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/6/66/Issyk_Kul_Lake_seen_from_space.jpg',
    ),
    Book(
      title: 'Nomadic Culture',
      author: 'Madina Toigonbaeva',
      pages: 140,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/f4/Kyrgyz_Yurt_%2832347648164%29.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Catalog',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomeScreen(books: books),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<Book> books;

  const HomeScreen({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Catalog')),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            leading: Image.network(
              book.imageUrl,
              width: 50,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image),
            ),
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BookPageViewScreen(books: books, initialIndex: index),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookPageViewScreen extends StatelessWidget {
  final List<Book> books;
  final int initialIndex;

  const BookPageViewScreen({super.key, required this.books, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: initialIndex);

    return Scaffold(
      appBar: AppBar(title: const Text('Book Pages')),
      body: PageView.builder(
        controller: controller,
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      book.imageUrl,
                      height: 300,
                      width: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 100),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(book.title,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Author: ${book.author}', style: const TextStyle(fontSize: 18)),
                  const SizedBox(height: 10),
                  Text('Pages: ${book.pages}', style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

