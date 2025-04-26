import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light());

  void toggleTheme() {
    emit(state.brightness == Brightness.dark
        ? ThemeData.light()
        : ThemeData.dark());
  }
}
