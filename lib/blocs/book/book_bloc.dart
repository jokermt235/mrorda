import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/book.dart';
import '../../repositories/book_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository repository;

  BookBloc(this.repository) : super(BookLoading()) {
    on<LoadBooks>((event, emit) async {
      emit(BookLoading());
      try {
        final books = await repository.getBooks();
        emit(BookLoaded(books));
      } catch (e) {
        emit(BookError("Failed to load books"));
      }
    });
  }
}
