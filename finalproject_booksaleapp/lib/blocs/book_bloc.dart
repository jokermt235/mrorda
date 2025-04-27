import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/book.dart';

class BookState extends Equatable {
  final List<Book> books;
  final bool isLoading;
  final String errorMessage;

  BookState({
    this.books = const [],
    this.isLoading = false,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [books, isLoading, errorMessage];

  BookState copyWith({
    List<Book>? books,
    bool? isLoading,
    String? errorMessage,
  }) {
    return BookState(
      books: books ?? this.books,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class LoadBooks extends BookEvent {}

// BLoC
class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookState());

  @override
  Stream<BookState> mapEventToState(BookEvent event) async* {
    if (event is LoadBooks) {
      yield state.copyWith(isLoading: true);
      try {
        await Future.delayed(Duration(seconds: 2));
        final books = [
          Book(
            id: '1',
            title: 'Book 1',
            author: 'Author 1',
            coverUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStmn_FnMvWKVD5zIwSWrRgHXerslztTrmt4Q&s',
            pages: 200,
            price: 19.99,
          ),
          Book(
            id: '2',
            title: 'Book 2',
            author: 'Author 2',
            coverUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStmn_FnMvWKVD5zIwSWrRgHXerslztTrmt4Q&s',
            pages: 150,
            price: 9.99,
          ),
        ];
        yield state.copyWith(books: books, isLoading: false);
      } catch (error) {
        yield state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to load books',
        );
      }
    }
  }
}
