// lib/blocs/home/home_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:final_booksaleapp/models/book.dart';
import 'package:final_booksaleapp/services/book_service.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BookService bookService;

  HomeBloc({required this.bookService}) : super(HomeLoading()) {
    on<LoadBooks>(_onLoadBooks);
    on<FilterByCategory>(_onFilterByCategory);
    on<SearchBooks>(_onSearchBooks);
  }

  Future<void> _onLoadBooks(LoadBooks event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final books = await bookService.getBooks();
      final updatedBooks = books.map((book) {
        String newImageUrl = '';
        switch (book.title) {
          case 'The Hitchhiker\'s Guide to the Galaxy':
            newImageUrl = 'https://covers.openlibrary.org/b/id/8729998-L.jpg';
            break;
          case 'Pride and Prejudice':
            newImageUrl = 'https://covers.openlibrary.org/b/id/135688-L.jpg';
            break;
          case '1984':
            newImageUrl = 'https://covers.openlibrary.org/b/id/7723418-L.jpg';
            break;
          case 'To Kill a Mockingbird':
            newImageUrl = 'https://covers.openlibrary.org/b/id/7277431-L.jpg';
            break;
          case 'The Lord of the Rings':
            newImageUrl = 'https://covers.openlibrary.org/b/id/12490999-L.jpg';
            break;
          case 'The Great Gatsby':
            newImageUrl = 'https://covers.openlibrary.org/b/id/1253888-L.jpg';
            break;
          default:
            newImageUrl = 'https://covers.openlibrary.org/b/id/9034975-L.jpg'; // Default fallback
        }
        return book.copyWith(coverImageUrl: newImageUrl);
      }).toList();
      emit(HomeLoaded(books: updatedBooks, filteredBooks: updatedBooks, selectedCategory: 'All'));
    } catch (e) {
      emit(HomeError(message: 'Failed to load books: $e'));
    }
  }

  void _onFilterByCategory(FilterByCategory event, Emitter<HomeState> emit) {
    print('HomeBloc - FilterByCategory event received: ${event.category}');
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      try {
        final filteredBooks = event.category == 'All'
            ? currentState.books
            : currentState.books.where((book) => book.category == event.category).toList();
        emit(currentState.copyWith(filteredBooks: filteredBooks, selectedCategory: event.category));
      } catch (e) {
        emit(HomeError(message: 'Error filtering by category: $e'));
      }
    } else if (state is HomeLoading) {
      // If still loading, do nothing or emit a loading state if needed
      print('HomeBloc - Still loading, ignoring filter event.');
    } else if (state is HomeError) {
      // If in error state, do nothing or potentially try to reload
      print('HomeBloc - In error state, ignoring filter event.');
    }
  }

  void _onSearchBooks(SearchBooks event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final currentState = state as HomeLoaded;
      try {
        final searchedBooks = currentState.books.where((book) =>
            book.title.toLowerCase().contains(event.query.toLowerCase()) ||
            book.author.toLowerCase().contains(event.query.toLowerCase())).toList();
        emit(currentState.copyWith(filteredBooks: searchedBooks));
      } catch (e) {
        emit(HomeError(message: 'Error during search: $e'));
      }
    }
  }
}