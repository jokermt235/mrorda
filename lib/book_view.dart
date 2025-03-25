import 'package:flutter/material.dart';
import 'package:lesson9riverpod/book.dart';

class BookView extends StatelessWidget{
  Book data;
  BookView({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child : Text(data.title)
        ),
      ),
      body: Container(
        child: Text(data.description),
      ),
    );
  }
}