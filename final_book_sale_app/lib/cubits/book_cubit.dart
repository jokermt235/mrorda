import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../repositories/book_repository.dart';

part 'book_state.dart'; // Подключаем состояние

class BookCubit extends Cubit<BookState> {
  final BookRepository repository;

  BookCubit(this.repository) : super(BookLoading());

  Future<void> loadBooks() async {
    try {
      final books = await repository.fetchBooks();
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError('Failed to load books'));
    }
  }
}
