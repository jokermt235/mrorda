import '../models/book.dart';

class BookService {
  List<Book> fetchBooks() {
    return [
      Book(
        id: '1',
        title: 'Flutter for Beginners',
        author: 'John Doe',
        price: 29.99,
        imageUrl: 'https://via.placeholder.com/150',
        pages: 300,
        category: 'Programming',
      ),
      Book(
        id: '2',
        title: 'Dart Advanced',
        author: 'Jane Smith',
        price: 39.99,
        imageUrl: 'https://via.placeholder.com/150',
        pages: 400,
        category: 'Programming',
      ),
      // добавь еще книги при желании
    ];
  }
}
