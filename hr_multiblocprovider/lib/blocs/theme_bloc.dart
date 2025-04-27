import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// События
abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

// BLoC
class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc()
      : super(ThemeData.light()) {
    on<ToggleTheme>((event, emit) {
      if (state.brightness == Brightness.light) {
        emit(ThemeData.dark());
      } else {
        emit(ThemeData.light());
      }
    });
  }
}
