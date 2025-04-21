import 'package:bloc/bloc.dart';
import 'package:book_store/features/book/data/models/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:book_store/features/book/domain/repositories/book_repository.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final BookRepository bookRepository;

  BookBloc({required this.bookRepository}) : super(BookInitial()) {
    on<LoadBookEvent>(_onLoadBook);
  }

  Future<void> _onLoadBook(LoadBookEvent event, Emitter<BookState> emit) async {
    emit(BookLoading());
    try {
      final book = await bookRepository.getBookById(event.bookId);
      emit(BookLoaded(book: book));
    } catch (e) {
      emit(BookError(message: e.toString()));
    }
  }
}