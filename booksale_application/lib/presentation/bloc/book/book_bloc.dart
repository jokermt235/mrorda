import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/book_model.dart';
import '../../../data/repositories/book_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository _bookRepository;
  BookBloc(this._bookRepository) : super(BookLoading()) {
    on<FetchBooks>(_onFetchBooks);
    on<SearchBooks>(_onSearchBooks);
    on<FilterByCategory>(_onFilterByCategory);
    on<FetchBookById>(_onFetchBookById);
  }

  Future<void> _onFetchBooks(FetchBooks event, Emitter<BookState> emit) async {
    try {
      emit(BookLoading());
      final books = await _bookRepository.getBooks();
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError('Failed to fetch books: $e'));
    }
  }

  Future<void> _onSearchBooks(SearchBooks event, Emitter<BookState> emit) async {
    try {
      emit(BookLoading());
      final books = await _bookRepository.searchBooks(event.query);
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError('Search failed: $e'));
    }
  }

  Future<void> _onFilterByCategory(FilterByCategory event, Emitter<BookState> emit) async {
    try {
      emit(BookLoading(selectedCategory: event.category));
      final books = await _bookRepository.fetchBooksByCategory(event.category);
      emit(BookLoaded(books, selectedCategory: event.category));
    } catch (e) {
      emit(BookError(
        'Filter failed: $e',
        selectedCategory: event.category, // Now works!
      ));
    }
  }

  @override
  void onTransition(Transition<BookEvent, BookState> transition) {
    super.onTransition(transition);
    print(transition);
  }

  Future<void> _onFetchBookById(FetchBookById event, Emitter<BookState> emit) async {
    try {
      emit(BookLoading());
      final book = await _bookRepository.getBookById(event.id);
      emit(BookDetailLoaded(book));
    } catch (e) {
      emit(BookError('Failed to fetch book: $e'));
    }
  }
}
