import 'package:bloc/bloc.dart';
import '/features/book/data/models/book_model.dart';
import '/features/book/data/repositories/book_repository.dart';
import 'package:equatable/equatable.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository repository;

  BookBloc(this.repository) : super(BookInitial()) {
    on<LoadBooks>(_onLoadBooks);
    on<SearchBooks>(_onSearchBooks);
    on<FilterByCategory>(_onFilterByCategory);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<DecreaseQuantity>(_onDecreaseQuantity);
  }

  Future<void> _onLoadBooks(LoadBooks event, Emitter<BookState> emit) async {
    emit(BookLoading());
    try {
      final books = await repository.getBooks();
      emit(BookLoaded(books: books, filteredBooks: books));
    } catch (e) {
      emit(BookError(message: e.toString()));
    }
  }

  void _onSearchBooks(SearchBooks event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      if (event.query.isEmpty) {
        emit(currentState.copyWith(filteredBooks: currentState.books));
      } else {
        final filtered = currentState.books.where((book) =>
            book.title.toLowerCase().contains(event.query.toLowerCase()) ||
            book.author.toLowerCase().contains(event.query.toLowerCase()));
        emit(currentState.copyWith(filteredBooks: filtered.toList()));
      }
    }
  }

  void _onFilterByCategory(FilterByCategory event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      if (event.category.isEmpty) {
        emit(currentState.copyWith(filteredBooks: currentState.books));
      } else {
        final filtered = currentState.books
            .where((book) => book.categories.contains(event.category))
            .toList();
        emit(currentState.copyWith(filteredBooks: filtered));
      }
    }
  }

  void _onAddToCart(AddToCart event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      final updatedBooks = currentState.books.map((book) {
        if (book.id == event.bookId) {
          return book.copyWith(quantity: book.quantity + 1);
        }
        return book;
      }).toList();

      final updatedFilteredBooks = currentState.filteredBooks.map((book) {
        if (book.id == event.bookId) {
          return book.copyWith(quantity: book.quantity + 1);
        }
        return book;
      }).toList();

      emit(currentState.copyWith(
        books: updatedBooks,
        filteredBooks: updatedFilteredBooks,
      ));
    }
  }

  void _onRemoveFromCart(RemoveFromCart event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      final updatedBooks = currentState.books.map((book) {
        if (book.id == event.bookId) {
          return book.copyWith(quantity: 0);
        }
        return book;
      }).toList();

      final updatedFilteredBooks = currentState.filteredBooks.map((book) {
        if (book.id == event.bookId) {
          return book.copyWith(quantity: 0);
        }
        return book;
      }).toList();

      emit(currentState.copyWith(
        books: updatedBooks,
        filteredBooks: updatedFilteredBooks,
      ));
    }
  }

  void _onDecreaseQuantity(DecreaseQuantity event, Emitter<BookState> emit) {
    if (state is BookLoaded) {
      final currentState = state as BookLoaded;
      final updatedBooks = currentState.books.map((book) {
        if (book.id == event.bookId && book.quantity > 0) {
          return book.copyWith(quantity: book.quantity - 1);
        }
        return book;
      }).toList();

      final updatedFilteredBooks = currentState.filteredBooks.map((book) {
        if (book.id == event.bookId && book.quantity > 0) {
          return book.copyWith(quantity: book.quantity - 1);
        }
        return book;
      }).toList();

      emit(currentState.copyWith(
        books: updatedBooks,
        filteredBooks: updatedFilteredBooks,
      ));
    }
  }
}