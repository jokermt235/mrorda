import '/features/book/data/models/book_model.dart';
import '/features/book/data/sources/local_book_source.dart';
import '/features/book/data/sources/remote_book_source.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
}

class BookRepositoryImpl implements BookRepository {
  final RemoteBookSource remoteSource;
  final LocalBookSource localSource;

  BookRepositoryImpl({required this.remoteSource, required this.localSource});

  @override
  Future<List<Book>> getBooks() async {
    try {
      // Try to get books from remote
      final remoteBooks = await remoteSource.fetchBooks();
      await localSource.cacheBooks(remoteBooks);
      return remoteBooks;
    } catch (e) {
      // Fallback to local if remote fails
      final localBooks = await localSource.getCachedBooks();
      if (localBooks.isNotEmpty) {
        return localBooks;
      }
      rethrow;
    }
  }
}