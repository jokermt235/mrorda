import 'package:flutter/material.dart';

class CategoryChooser extends StatelessWidget {
  const CategoryChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: const Text('Select Category'),
        onChanged: (value) {
          // Тут можно обновить состояние категории и фильтровать книги
        },
        items: const [
          DropdownMenuItem(value: 'Fiction', child: Text('Fiction')),
          DropdownMenuItem(value: 'Non-Fiction', child: Text('Non-Fiction')),
        ],
      ),
    );
  }
}
