import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.blue);

  void changeColor() {
    emit(state == Colors.blue ? Colors.red : Colors.blue);
  }
}
