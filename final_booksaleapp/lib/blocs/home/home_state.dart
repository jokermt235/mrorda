part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({this.books = const [], this.filteredBooks = const [], this.selectedCategory = 'All'});

  final List<Book> books;
  final List<Book> filteredBooks;
  final String selectedCategory;

  HomeState copyWith({
    List<Book>? books,
    List<Book>? filteredBooks,
    String? selectedCategory,
  }) {
    return HomeState(
      books: books ?? this.books,
      filteredBooks: filteredBooks ?? this.filteredBooks,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  List<Object?> get props => [books, filteredBooks, selectedCategory];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  const HomeLoaded({super.books, super.filteredBooks, super.selectedCategory});
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object?> get props => [message];
}