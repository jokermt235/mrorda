import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finals_project/features/books/data/repositories/book_repository.dart';
import 'package:finals_project/features/books/domain/models/book.dart';

// Events
abstract class BookEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadBooksEvent extends BookEvent {}

class SearchBooksEvent extends BookEvent {
  final String query;

  SearchBooksEvent(this.query);

  @override
  List<Object> get props => [query];
}

class FilterBooksByCategoryEvent extends BookEvent {
  final String category;

  FilterBooksByCategoryEvent(this.category);

  @override
  List<Object> get props => [category];
}

// States
abstract class BookState extends Equatable {
  @override
  List<Object> get props => [];
}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Book> allBooks;
  final List<Book> displayedBooks;
  final List<String> categories;
  final String selectedCategory;
  final String searchQuery;

  BookLoaded({
    required this.allBooks,
    required this.displayedBooks,
    required this.categories,
    this.selectedCategory = 'All',
    this.searchQuery = '',
  });

  @override
  List<Object> get props => [
        allBooks,
        displayedBooks,
        categories,
        selectedCategory,
        searchQuery,
      ];

  BookLoaded copyWith({
    List<Book>? allBooks,
    List<Book>? displayedBooks,
    List<String>? categories,
    String? selectedCategory,
    String? searchQuery,
  }) {
    return BookLoaded(
      allBooks: allBooks ?? this.allBooks,
      displayedBooks: displayedBooks ?? this.displayedBooks,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

class BookError extends BookState {
  final String message;

  BookError(this.message);

  @override
  List<Object> get props => [message];
}

// Bloc
class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository _bookRepository;

  BookBloc(this._bookRepository) : super(BookInitial()) {
    on<LoadBooksEvent>(_onLoadBooks);
    on<SearchBooksEvent>(_onSearchBooks);
    on<FilterBooksByCategoryEvent>(_onFilterBooksByCategory);
  }

  Future<void> _onLoadBooks(
    LoadBooksEvent event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.getBooks();
      final categories = _bookRepository.getAllCategories(books);
      categories.insert(0, 'All');

      emit(BookLoaded(
        allBooks: books,
        displayedBooks: books,
        categories: categories,
      ));
    } catch (e) {
      emit(BookError(e.toString()));
    }
  }

  void _onSearchBooks(
    SearchBooksEvent event,
    Emitter<BookState> emit,
  ) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      final filteredBooks = _bookRepository.searchBooks(
        _bookRepository.filterBooksByCategory(
          currentState.allBooks,
          currentState.selectedCategory,
        ),
        event.query,
      );

      emit(currentState.copyWith(
        displayedBooks: filteredBooks,
        searchQuery: event.query,
      ));
    }
  }

  void _onFilterBooksByCategory(
    FilterBooksByCategoryEvent event,
    Emitter<BookState> emit,
  ) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      final filteredBooks = _bookRepository.filterBooksByCategory(
        currentState.allBooks,
        event.category,
      );

      final searchFilteredBooks = _bookRepository.searchBooks(
        filteredBooks,
        currentState.searchQuery,
      );

      emit(currentState.copyWith(
        displayedBooks: searchFilteredBooks,
        selectedCategory: event.category,
      ));
    }
  }
}
