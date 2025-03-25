import 'package:flutter/material.dart';
import 'package:lesson9riverpod/book.dart';

class BookCover extends StatelessWidget{
  Book data;
  BookCover({required this.data});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 200,
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2), // Чёрная граница толщиной 2px
        ),
        child: Column(
          children: [
            SizedBox(
              child: Text(data.price.toString()),
            ),
            SizedBox(
              child: Text(data.title),
            ),
          ],
        )
    );
  }
}