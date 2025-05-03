import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../book.dart';
import 'book_event.dart';
import 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final Dio dio;

  BookBloc({required this.dio}) : super(BookInitial()) {
    on<LoadBooks>((event, emit) async {
      emit(BookLoading());
      try {
        final response = await dio.get(AppConstants.mockApiUrl);
        final books = (response.data as List)
            .map((json) => Book.fromJson(json))
            .toList();
        emit(BookLoaded(books));
      } catch (e) {
        emit(BookError('Failed to load books'));
      }
    });
  }
}