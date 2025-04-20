import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: ThemeData.light())) {
    on<ToggleTheme>((event, emit) {
      final isDark = state.themeData.brightness == Brightness.dark;
      emit(
        ThemeState(
          themeData: isDark ? ThemeData.light() : ThemeData.dark(),
        ),
      );
    });
  }
}