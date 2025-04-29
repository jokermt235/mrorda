import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:finals_project/features/shared/data/models/book_model.dart';
import 'book_event.dart';
import 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookLoading());

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is FetchBooks) {
      yield BookLoading();
      try {
        // Здесь можно подгрузить книги с сервера или из базы данных
        await Future.delayed(const Duration(seconds: 2)); // Симуляция задержки
        final books = [
          BookModel(
            title: 'Book 1',
            coverUrl: 'https://via.placeholder.com/150',
            category: 'Fiction',
            price: 20.0,
            pages: 200,
          ),
          BookModel(
            title: 'Book 2',
            coverUrl: 'https://via.placeholder.com/150',
            category: 'Non-Fiction',
            price: 25.0,
            pages: 300,
          ),
        ];
        yield BookLoaded(books);
      } catch (e) {
        yield BookError('Failed to load books');
      }
    }
  }
}
