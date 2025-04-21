part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<BookModel> books;
  final List<BookModel> filteredBooks;
  final List<String> categories;

  const HomeLoaded({
    required this.books,
    required this.filteredBooks,
    required this.categories,
  });

  HomeLoaded copyWith({
    List<BookModel>? books,
    List<BookModel>? filteredBooks,
    List<String>? categories,
  }) {
    return HomeLoaded(
      books: books ?? this.books,
      filteredBooks: filteredBooks ?? this.filteredBooks,
      categories: categories ?? this.categories,
    );
  }

  @override
  List<Object> get props => [books, filteredBooks, categories];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}