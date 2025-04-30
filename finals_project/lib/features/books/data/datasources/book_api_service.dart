import 'package:finals_project/core/error/exceptions.dart';
import 'package:finals_project/features/books/domain/models/book.dart';

class BookApiService {
  Future<List<Book>> getBooks() async {
    try {
      return _getMockBooks();
    } catch (e) {
      throw ServerException('Failed to fetch books: ${e.toString()}');
    }
  }

  List<Book> _getMockBooks() => [
        Book(
          id: 1,
          title: 'The Great Gatsby',
          author: 'F. Scott Fitzgerald',
          coverUrl: 'https://i.imgur.com/uuxJaEY.jpg',
          price: 12.99,
          pageCount: 180,
          category: 'Fiction',
          rating: 4.5,
          description: 'A classic novel about the American Dream...',
        ),
        Book(
          id: 2,
          title: 'To Kill a Mockingbird',
          author: 'Harper Lee',
          coverUrl: 'https://i.imgur.com/IaOVrQ5.jpg',
          price: 10.99,
          pageCount: 281,
          category: 'Fiction',
          rating: 4.8,
          description: 'Novel about racial injustice...',
        ),
      ];
}
