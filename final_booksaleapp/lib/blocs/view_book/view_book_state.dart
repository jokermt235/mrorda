part of 'view_book_bloc.dart';

abstract class ViewBookState extends Equatable {
  const ViewBookState();

  @override
  List<Object?> get props => [];
}

class ViewBookInitial extends ViewBookState {}

class ViewBookLoading extends ViewBookState {}

class ViewBookLoaded extends ViewBookState {
  final Book book;

  const ViewBookLoaded({required this.book});

  @override
  List<Object?> get props => [book];
}

class ViewBookError extends ViewBookState {
  final String message;

  const ViewBookError({required this.message});

  @override
  List<Object?> get props => [message];
}