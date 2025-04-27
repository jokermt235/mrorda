part of 'view_book_bloc.dart';

abstract class ViewBookEvent extends Equatable {
  const ViewBookEvent();

  @override
  List<Object?> get props => [];
}

class LoadBookDetails extends ViewBookEvent {
  final String? bookId;

  const LoadBookDetails({required this.bookId});

  @override
  List<Object?> get props => [bookId];
}