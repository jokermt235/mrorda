import '../models/book_model.dart';

class BookService {
  Future<List<Book>> fetchBooks() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate server delay
    return [
      Book(id: '1', title: 'Flutter 101', coverUrl: '', pages: 200, price: 20.0, category: 'Tech'),
      Book(id: '2', title: 'Dart Deep Dive', coverUrl: '', pages: 300, price: 25.0, category: 'Tech'),
      Book(id: '3', title: 'The Mystery of the Lost City', coverUrl: '', pages: 150, price: 18.0, category: 'Fiction'),
      Book(id: '4', title: 'History of the World', coverUrl: '', pages: 400, price: 30.0, category: 'History'),
      Book(id: '5', title: 'Science for Beginners', coverUrl: '', pages: 250, price: 22.0, category: 'Science'),
      Book(id: '6', title: 'Fictional Tales', coverUrl: '', pages: 180, price: 15.0, category: 'Fiction'),
    ];
  }
}
