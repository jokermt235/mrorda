import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/book.dart';
import '../../repositories/book_repository.dart';

abstract class BookEvent {}
class LoadBooks extends BookEvent {}

abstract class BookState {}
class BookLoading extends BookState {}
class BookLoaded extends BookState {
  final List<Book> books;
  BookLoaded(this.books);
}
class BookError extends BookState {}

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc(this.bookRepository) : super(BookLoading()) {
    on<LoadBooks>((event, emit) async {
      try {
        final books = await bookRepository.fetchBooks();
        emit(BookLoaded(books));
      } catch (_) {
        emit(BookError());
      }
    });
  }
}
