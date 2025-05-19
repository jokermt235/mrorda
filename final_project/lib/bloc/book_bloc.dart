import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/book.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookInitial()) {
    on<LoadBooks>((event, emit) async {
      emit(BookLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(
        BookLoaded(
          books: [
            Book(
              id: '1',
              title: 'Flutter Basics',
              price: 29.99,
              pages: 300,
              category: 'Programming',
              coverUrl: '',
            ),
            Book(
              id: '2',
              title: 'Dart Essentials',
              price: 19.99,
              pages: 200,
              category: 'Programming',
              coverUrl: '',
            ),
          ],
        ),
      );
    });
  }
}
