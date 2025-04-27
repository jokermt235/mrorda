import 'package:booksaleapp/data/models/book.dart';

class BookRepository {
  Future<List<Book>> fetchBooks() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return List.generate(5, (i) {
      final idx = i + 1;
      
      final pages = List<String>.generate(50, (p) {
        if (p == 0) return 'Содержимое книги $idx, страница 1';
        if (p == 1) return 'Содержимое книги $idx, страница 2';
        return '';
      });
      return Book(
        id: '$idx',
        title: 'Book $idx',
        author: 'Author $idx',
        imageAsset: 'assets/images/image$idx.png',
        price: 10 + idx * 2.5,
        totalPages: pages.length,
        category: 'Category ${idx % 3}',
        description: 'Описание книги $idx. Это пример аннотации.',
        pagesContent: pages,
      );
    });
  }
}