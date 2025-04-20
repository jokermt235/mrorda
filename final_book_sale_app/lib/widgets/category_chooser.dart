import 'package:flutter/material.dart';

class CategoryChooser extends StatelessWidget {
  final List<String> categories = ["All", "Programming", "Design", "Science"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Chip(
            label: Text(categories[index]),
            backgroundColor: Colors.blue[100],
          ),
        ),
      ),
    );
  }
}
