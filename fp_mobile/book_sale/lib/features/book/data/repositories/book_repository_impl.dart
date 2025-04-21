import 'package:book_store/features/book/domain/repositories/book_repository.dart';
import 'package:book_store/features/book/data/models/book_model.dart';
import 'package:book_store/features/book/data/datasources/book_local_data_source.dart';

class BookRepositoryImpl implements BookRepository {
  final BookLocalDataSource localDataSource;

  BookRepositoryImpl({required this.localDataSource});

  @override
  Future<List<BookModel>> getAllBooks() async {
    return await localDataSource.getAllBooks();
  }

  @override
  Future<BookModel> getBookById(String id) async {
    return await localDataSource.getBookById(id);
  }
}