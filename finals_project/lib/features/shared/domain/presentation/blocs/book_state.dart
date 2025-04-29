import 'package:finals_project/features/shared/data/models/book_model.dart';

abstract class BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<BookModel> books;

  BookLoaded(this.books);
}

class BookError extends BookState {
  final String message;

  BookError(this.message);
}
