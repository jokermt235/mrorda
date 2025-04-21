import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:book_store/features/book/domain/repositories/book_repository.dart';
import 'package:book_store/features/book/data/models/book_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BookRepository bookRepository;

  HomeBloc({required this.bookRepository}) : super(HomeInitial()) {
    on<LoadBooksEvent>(_onLoadBooks);
    on<SearchBooksEvent>(_onSearchBooks);
    on<FilterByCategoryEvent>(_onFilterByCategory);
  }

  Future<void> _onLoadBooks(LoadBooksEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final books = await bookRepository.getAllBooks();
      emit(HomeLoaded(
        books: books,
        filteredBooks: books,
        categories: _extractCategories(books),
      ));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> _onSearchBooks(SearchBooksEvent event, Emitter<HomeState> emit) async {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      if (event.query.isEmpty) {
        emit(currentState.copyWith(filteredBooks: currentState.books));
        return;
      }

      final filtered = currentState.books.where((book) =>
          book.title.toLowerCase().contains(event.query.toLowerCase()) ||
          book.author.toLowerCase().contains(event.query.toLowerCase())).toList();

      emit(currentState.copyWith(filteredBooks: filtered));
    }
  }

  Future<void> _onFilterByCategory(FilterByCategoryEvent event, Emitter<HomeState> emit) async {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      if (event.category == null) {
        emit(currentState.copyWith(filteredBooks: currentState.books));
        return;
      }

      final filtered = currentState.books
          .where((book) => book.category == event.category)
          .toList();

      emit(currentState.copyWith(filteredBooks: filtered));
    }
  }

  List<String> _extractCategories(List<BookModel> books) {
    final categories = books.map((book) => book.category).toSet().toList();
    categories.insert(0, 'All');
    return categories;
  }
}