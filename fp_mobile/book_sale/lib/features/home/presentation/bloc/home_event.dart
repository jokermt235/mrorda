part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadBooksEvent extends HomeEvent {}

class SearchBooksEvent extends HomeEvent {
  final String query;

  const SearchBooksEvent({required this.query});

  @override
  List<Object> get props => [query];
}

class FilterByCategoryEvent extends HomeEvent {
  final String? category;

  const FilterByCategoryEvent({this.category});

  @override
  List<Object> get props => [category ?? ''];
}