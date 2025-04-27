// lib/bloc/book_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_booksale_app/models/book_model.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookLoading()) {
    on<LoadBooks>(_onLoadBooks);
    on<SearchBooks>(_onSearchBooks);
    on<FilterBooksByCategory>(_onFilterBooksByCategory);
  }

  Future<void> _onLoadBooks(LoadBooks event, Emitter<BookState> emit) async {
    emit(BookLoading());
    try {
      await Future.delayed(const Duration(seconds: 1)); // Simulate loading
      final List<Book> fetchedBooks = [
        Book(id: '1', title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', coverImageUrl: 'https://covers.openlibrary.org/b/id/8231481-L.jpg', price: 9.99, pages: 180, category: 'Fiction', description: 'A tragic love story set in the Jazz Age, exploring themes of wealth, class, and the American Dream.'),
        Book(id: '2', title: 'To Kill a Mockingbird', author: 'Harper Lee', coverImageUrl: 'https://covers.openlibrary.org/b/id/7279000-L.jpg', price: 12.50, pages: 336, category: 'Fiction', description: 'A powerful story of racial injustice and childhood innocence in the American South, narrated through the eyes of a young girl.'),
        Book(id: '3', title: 'Sapiens: A Brief History of Humankind', author: 'Yuval Noah Harari', coverImageUrl: 'https://covers.openlibrary.org/b/id/12278837-L.jpg', price: 15.00, pages: 498, category: 'History', description: 'A sweeping exploration of the history of Homo sapiens, from our early origins to the present day, examining the key forces that have shaped our species.'),
        Book(id: '4', title: 'Pride and Prejudice', author: 'Jane Austen', coverImageUrl: 'https://covers.openlibrary.org/b/id/7348703-L.jpg', price: 10.75, pages: 432, category: 'Fiction', description: 'A witty and elegant novel of manners, following the intricate relationships and societal expectations of the English gentry in the 19th century.'),
        Book(id: '5', title: '1984', author: 'George Orwell', coverImageUrl: 'https://covers.openlibrary.org/b/id/7279071-L.jpg', price: 11.20, pages: 328, category: 'Fiction', description: 'A dystopian novel exploring the dangers of totalitarianism, surveillance, and the manipulation of truth in a future oppressive regime.'),
        Book(id: '6', title: 'Cosmos', author: 'Carl Sagan', coverImageUrl: 'https://covers.openlibrary.org/b/id/8722999-L.jpg', price: 18.99, pages: 365, category: 'Science', description: 'A captivating journey through the wonders of the universe, exploring astronomy, cosmology, and our place in the vast cosmos, based on the iconic television series.'),
      ];
      emit(BookLoaded(books: fetchedBooks));
    } catch (e) {
      emit(BookError('Failed to load books'));
    }
  }

  void _onSearchBooks(SearchBooks event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final filteredBooks = state.books
          .where((book) =>
              book.title.toLowerCase().contains(event.query.toLowerCase()) ||
              book.author.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(BookLoaded(books: filteredBooks));
    }
  }

  void _onFilterBooksByCategory(FilterBooksByCategory event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final filteredBooks = state.books
          .where((book) => book.category == event.category)
          .toList();
      emit(BookLoaded(books: filteredBooks));
    }
  }
}