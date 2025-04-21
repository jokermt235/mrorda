part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class LoadBookEvent extends BookEvent {
  final String bookId;

  const LoadBookEvent({required this.bookId});

  @override
  List<Object> get props => [bookId];
}