import 'package:sqflite/sqflite.dart';

abstract class BookLocalDataSource {
  Future<List<Map<String, dynamic>>> getBooks();
  Future<List<Map<String, dynamic>>> searchBooks(String query);
  Future<void> cacheBooks(List<Map<String, dynamic>> books);
}

class BookSqliteDataSource implements BookLocalDataSource {
  final Database db;

  BookSqliteDataSource({required this.db});

  @override
  Future<List<Map<String, dynamic>>> getBooks() async {
    final result = await db.query('books');
    return result ?? [];
  }

  @override
  Future<List<Map<String, dynamic>>> searchBooks(String query) async {
    return await db.query(
      'books',
      where: 'title LIKE ? OR author LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
    );
  }

  @override
  Future<void> cacheBooks(List<Map<String, dynamic>> books) async {
    final batch = db.batch();
    for (final book in books) {
      batch.insert(
        'books',
        book,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit();
  }
}