import 'package:flutter/material.dart';
import 'book_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Library',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,  // Цвет основного приложения
        brightness: Brightness.dark,       // Темная тема
        fontFamily: 'Roboto',              // Шрифт
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple, // Цвет для AppBar
        ),
        cardTheme: CardTheme(
          color: Colors.blueGrey[800],  // Цвет карточек
          elevation: 8,                 // Тень для карточек
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),  // Закругленные углы для карточек
        ),
      ),
      home: BookListScreen(),  // Главный экран
    );
  }
}
