import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Events
abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

// Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeMode> {
  ThemeBloc() : super(ThemeMode.light) {
    on<ToggleTheme>((event, emit) {
      emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
    });
  }
}
