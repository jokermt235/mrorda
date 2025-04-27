part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadBooks extends HomeEvent {}

class FilterByCategory extends HomeEvent {
  final String category;

  const FilterByCategory({required this.category});

  @override
  List<Object?> get props => [category];
}

class SearchBooks extends HomeEvent {
  final String query;

  const SearchBooks({required this.query});

  @override
  List<Object?> get props => [query];
}