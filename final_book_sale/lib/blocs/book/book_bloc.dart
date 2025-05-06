import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/book_service.dart';
import 'book_event.dart';
import 'book_state.dart';
import '../../models/book_model.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookService bookService;
  List<Book> allBooks = [];

  BookBloc(this.bookService) : super(BookInitial()) {
    on<LoadBooks>(_onLoadBooks);
    on<FilterBooksByCategory>(_onFilterBooksByCategory);
    on<SearchBooks>(_onSearchBooks);
  }

  Future<void> _onLoadBooks(LoadBooks event, Emitter<BookState> emit) async {
    emit(BookLoading());
    try {
      allBooks = await bookService.fetchBooks();
      emit(BookLoaded(allBooks));
    } catch (e) {
      emit(BookError('Failed to load books'));
    }
  }

  void _onFilterBooksByCategory(FilterBooksByCategory event, Emitter<BookState> emit) {
    if (event.category == 'All') {
      emit(BookLoaded(allBooks));
    } else {
      final filtered = allBooks.where((book) => book.category == event.category).toList();
      emit(BookLoaded(filtered));
    }
  }

  void _onSearchBooks(SearchBooks event, Emitter<BookState> emit) {
    final query = event.query.toLowerCase();
    final filtered = allBooks.where((book) => book.title.toLowerCase().contains(query)).toList();
    emit(BookLoaded(filtered));
  }
}
