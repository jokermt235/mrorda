import '../models/book.dart';

class BookService {
  final List<Book> _books = [
    Book(
      id: '1',
      title: 'Flutter for Beginners',
      author: 'Jane Doe',
      coverUrl: 'https://placehold.co/200x300',
      pages: 300,
      price: 29.99,
      category: 'Programming',
    ),
    Book(
      id: '2',
      title: 'Dart Deep Dive',
      author: 'John Smith',
      coverUrl: 'https://placehold.co/200x300',
      pages: 250,
      price: 24.99,
      category: 'Programming',
    ),
    Book(
      id: '3',
      title: 'Advanced Flutter',
      author: 'Alice Johnson',
      coverUrl: 'https://placehold.co/200x300',
      pages: 400,
      price: 34.99,
      category: 'Programming',
    ),
    Book(
      id: '4',
      title: 'Mobile UI Design',
      author: 'Bob Brown',
      coverUrl: 'https://placehold.co/200x300',
      pages: 220,
      price: 19.99,
      category: 'Design',
    ),
    Book(
      id: '5',
      title: 'The Art of Coding',
      author: 'Charlie White',
      coverUrl: 'https://placehold.co/200x300',
      pages: 350,
      price: 39.99,
      category: 'Programming',
    ),
    Book(
      id: '6',
      title: 'UI/UX Principles',
      author: 'Diana Green',
      coverUrl: 'https://placehold.co/200x300',
      pages: 280,
      price: 27.99,
      category: 'Design',
    ),
  ];

  List<Book> getBooks({String? category, String? search}) {
    var result = _books;
    if (category != null && category != "All") {
      result = result.where((b) => b.category == category).toList();
    }
    if (search != null && search.isNotEmpty) {
      result = result.where((b) =>
          b.title.toLowerCase().contains(search.toLowerCase())).toList();
    }
    return result;
  }

  Book? getBookById(String id) {
    return _books.firstWhere((b) => b.id == id, orElse: () => throw Exception('Book not found'));
  }

  List<String> getCategories() {
    return ["All", ..._books.map((b) => b.category).toSet()];
  }
}