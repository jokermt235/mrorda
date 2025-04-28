import 'package:flutter/material.dart';

class CategoryChooser extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategoryChooser({Key? key, required this.onCategorySelected}) : super(key: key);

  @override
  State<CategoryChooser> createState() => _CategoryChooserState();
}

class _CategoryChooserState extends State<CategoryChooser> {
  final List<String> categories = [
    'All',
    'Programming',
    'Software Engineering',
    'Game Development',
    'Interview Prep',
    'Project Management',
    'Productivity',
    'AI & Development',
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.grey.shade200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ChoiceChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  selectedCategory = category;
                });
                widget.onCategorySelected(category);
              },
            ),
          );
        },
      ),
    );
  }
}
