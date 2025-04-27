import 'package:dartz/dartz.dart';
import 'package:final_book_sale_app/features/book/domain/repositories/book_repository.dart';
import 'package:final_book_sale_app/features/book/domain/entities/book.dart';
import 'package:final_book_sale_app/features/book/domain/failures.dart';

class SearchBooksUseCase {
  final BookRepository repository;

  SearchBooksUseCase(this.repository);

  Future<Either<Failure, List<Book>>> call(String query) async {
    try {
      final books = await repository.searchBooks(query);
      return Right(books);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}