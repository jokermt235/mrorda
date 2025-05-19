part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  final String? selectedCategory;
  const BookState({this.selectedCategory});

  @override
  List<Object> get props => [];
}

class BookLoading extends BookState {
  const BookLoading({super.selectedCategory});
}

class BookLoaded extends BookState {
  final List<BookModel> books;
  const BookLoaded(this.books, {super.selectedCategory});

  @override
  List<Object> get props => [books, selectedCategory ?? ''];
}

class BookDetailLoaded extends BookState {
  final BookModel book;
  const BookDetailLoaded(this.book) : super();

  @override
  List<Object> get props => [book];
}

class BookError extends BookState {
  final String message;
  const BookError(this.message, {super.selectedCategory}); // Add selectedCategory

  @override
  List<Object> get props => [message, selectedCategory ?? ''];
}