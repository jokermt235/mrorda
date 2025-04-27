import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:math';

class TextColorCubit extends Cubit<Color> {
  TextColorCubit() : super(Colors.black);

  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.brown,
  ];

  final Random _random = Random();

  void changeColor() {
    emit(_colors[_random.nextInt(_colors.length)]);
  }
}
