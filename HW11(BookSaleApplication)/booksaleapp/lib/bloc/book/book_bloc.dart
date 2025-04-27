import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booksaleapp/service/book_service.dart';
import 'package:booksaleapp/bloc/book/book_event.dart';
import 'package:booksaleapp/bloc/book/book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookService _service;

  BookBloc(this._service) : super(BookLoading()) {
    on<LoadBooks>((_, emit) async {
      emit(BookLoading());
      final list = await _service.fetchAll();
      emit(BookLoaded(list));
    });

    on<SearchBooks>((event, emit) async {
      emit(BookLoading());
      final filtered = await _service.search(event.query);
      emit(BookLoaded(filtered));
    });
  }
}