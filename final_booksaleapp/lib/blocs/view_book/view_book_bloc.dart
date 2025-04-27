//lib/blocs/view_book/view_book_bloc.dart

import 'package:bloc/bloc.dart';
import 'package:final_booksaleapp/models/book.dart';
import 'package:final_booksaleapp/services/book_service.dart';
import 'package:equatable/equatable.dart';

part 'view_book_event.dart';
part 'view_book_state.dart';

class ViewBookBloc extends Bloc<ViewBookEvent, ViewBookState> {
  final BookService bookService;

  ViewBookBloc({required this.bookService}) : super(ViewBookInitial()) {
    on<LoadBookDetails>(_onLoadBookDetails);
  }

  Future<void> _onLoadBookDetails(LoadBookDetails event, Emitter<ViewBookState> emit) async {
    emit(ViewBookLoading());
    try {
      // In a real app, you would fetch the book details based on the ID
      final allBooks = await bookService.getBooks();
      final book = allBooks.firstWhere((b) => b.id == event.bookId, orElse: () => Book(id: '', title: '', author: '', price: 0, pages: 0, coverImageUrl: '', category: ''));
      if (book.id.isNotEmpty) {
        emit(ViewBookLoaded(book: book));
      } else {
        emit(const ViewBookError(message: 'Book not found'));
      }
    } catch (e) {
      emit(ViewBookError(message: 'Failed to load book details'));
    }
  }
}