// lib/blocs/theme_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(false) {
    on<ToggleTheme>((event, emit) => emit(!state));
  }
}

// Theme Events
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
  @override
  List<Object> get props => [];
}

class ToggleTheme extends ThemeEvent {}