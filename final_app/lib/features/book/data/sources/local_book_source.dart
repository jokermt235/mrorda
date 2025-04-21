import '/features/book/data/models/book_model.dart';

abstract class LocalBookSource {
  Future<List<Book>> getCachedBooks();
  Future<void> cacheBooks(List<Book> books);
}

class LocalBookSourceImpl implements LocalBookSource {
  List<Book>? _cachedBooks;

  @override
  Future<List<Book>> getCachedBooks() async {
    if (_cachedBooks != null) return _cachedBooks!;
    // In a real app, this would read from shared preferences or SQLite
    return [];
  }

  @override
  Future<void> cacheBooks(List<Book> books) async {
    _cachedBooks = books;
    // In a real app, this would save to shared preferences or SQLite
  }
}