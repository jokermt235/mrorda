import 'package:dartz/dartz.dart';
import 'package:final_book_sale_app/features/book/domain/failures.dart';
import 'package:final_book_sale_app/features/book/domain/repositories/book_repository.dart';
import 'package:final_book_sale_app/features/book/domain/entities/book.dart';

class GetBooks {
  final BookRepository repository;

  GetBooks(this.repository);

  Future<Either<Failure, List<Book>>> call() async {
    try {
      final books = await repository.getBooks();
      return Right(books ?? []);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
