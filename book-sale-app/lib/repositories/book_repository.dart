import '../models/book.dart';

class BookRepository {
  final List<Book> _allBooks = [
    const Book(
      id: '1',
      title: 'Flutter Basics',
      author: 'Dev Author',
      coverUrl: 'https://picsum.photos/seed/fb/200/300',
      price: 29.99,
      pages: 350,
      category: 'Programming',
    ),
    const Book(
      id: '2',
      title: 'Advanced Dart',
      author: 'Expert Coder',
      coverUrl: 'https://picsum.photos/seed/ad/200/300',
      price: 39.99,
      pages: 500,
      category: 'Programming',
    ),
    const Book(
      id: '3',
      title: 'Mobile UI/UX',
      author: 'Designer Guru',
      coverUrl: 'https://picsum.photos/seed/ux/200/300',
      price: 24.50,
      pages: 280,
      category: 'Design',
    ),
    const Book(
      id: '4',
      title: 'The Silent Forest',
      author: 'Nature Writer',
      coverUrl: 'https://picsum.photos/seed/sf/200/300',
      price: 19.95,
      pages: 320,
      category: 'Fiction',
    ),
    const Book(
      id: '5',
      title: 'Startup Guide',
      author: 'Business Pro',
      coverUrl: 'https://picsum.photos/seed/sg/200/300',
      price: 35.00,
      pages: 410,
      category: 'Business',
    ),
    const Book(
      id: '6',
      title: 'Creative Design',
      author: 'Artist A',
      coverUrl: 'https://picsum.photos/seed/cd/200/300',
      price: 28.00,
      pages: 250,
      category: 'Design',
    ),
    const Book(
      id: '7',
      title: 'Another Flutter Book',
      author: 'Dev Author',
      coverUrl: 'https://picsum.photos/seed/afb/200/300',
      price: 32.00,
      pages: 400,
      category: 'Programming',
    ),
    const Book(
      id: '8',
      title: 'Mystery Novel',
      author: 'Fiction Fan',
      coverUrl: 'https://picsum.photos/seed/mn/200/300',
      price: 15.99,
      pages: 380,
      category: 'Fiction',
    ),
  ];

  Future<List<Book>> fetchBooks({String? query, String? category}) async {
    await Future.delayed(const Duration(milliseconds: 800));

    List<Book> results = _allBooks;

    if (category != null && category != 'All') {
      results = results.where((book) => book.category == category).toList();
    }

    if (query != null && query.isNotEmpty) {
      results =
          results
              .where(
                (book) =>
                    book.title.toLowerCase().contains(query.toLowerCase()) ||
                    book.author.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }

    return results;
  }

  Future<Book?> fetchBookById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _allBooks.firstWhere((book) => book.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<String>> fetchCategories() async {
    await Future.delayed(const Duration(milliseconds: 200));
    final categories = _allBooks.map((book) => book.category).toSet().toList();
    categories.insert(0, 'All');
    return categories;
  }
}
