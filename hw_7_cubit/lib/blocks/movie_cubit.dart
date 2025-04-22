import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/movie.dart';

class MovieCubit extends Cubit<List<Movie>> {
  MovieCubit() : super([]);

  void addMovie(Movie movie) {
    final updatedList = List<Movie>.from(state);
    updatedList.add(movie);
    emit(updatedList);
  }

  void removeMovie(int index) {
    final updatedList = List<Movie>.from(state)..removeAt(index);
    emit(updatedList);
  }
}