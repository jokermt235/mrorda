import 'package:booksaleapp/data/models/book.dart';

abstract class BookState {}

class BookLoading extends BookState {}
class BookLoaded extends BookState {
  final List<Book> books;
  BookLoaded(this.books);
}