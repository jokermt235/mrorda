import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/book_repository.dart';
import 'book_event.dart';
import 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;
  List<String> _cachedCategories = [];

  BookBloc({required this.bookRepository}) : super(BookInitial()) {
    on<LoadBooks>(_onLoadBooks);
    on<SearchBooks>(_onSearchBooks);
    on<FilterBooksByCategory>(_onFilterBooksByCategory);
    on<LoadCategories>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<BookState> emit,
  ) async {
    try {
      _cachedCategories = await bookRepository.fetchCategories();
      add(LoadBooks());
    } catch (e) {
      emit(const BookError("Failed to load categories"));
    }
  }

  Future<void> _onLoadBooks(LoadBooks event, Emitter<BookState> emit) async {
    emit(BookLoading());
    try {
      if (_cachedCategories.isEmpty) {
        _cachedCategories = await bookRepository.fetchCategories();
      }
      final books = await bookRepository.fetchBooks();
      emit(
        BookLoaded(
          books: books,
          categories: _cachedCategories,
          activeCategory: 'All',
        ),
      );
    } catch (e) {
      emit(const BookError("Failed to load books"));
    }
  }

  Future<void> _onSearchBooks(
    SearchBooks event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      if (_cachedCategories.isEmpty) {
        _cachedCategories = await bookRepository.fetchCategories();
      }
      final books = await bookRepository.fetchBooks(query: event.query);
      emit(
        BookLoaded(
          books: books,
          categories: _cachedCategories,
          activeCategory: 'All',
        ),
      );
    } catch (e) {
      emit(const BookError("Failed to search books"));
    }
  }

  Future<void> _onFilterBooksByCategory(
    FilterBooksByCategory event,
    Emitter<BookState> emit,
  ) async {
    emit(BookLoading());
    try {
      if (_cachedCategories.isEmpty) {
        _cachedCategories = await bookRepository.fetchCategories();
      }
      final books = await bookRepository.fetchBooks(category: event.category);
      emit(
        BookLoaded(
          books: books,
          categories: _cachedCategories,
          activeCategory: event.category,
        ),
      );
    } catch (e) {
      emit(const BookError("Failed to filter books"));
    }
  }
}
