// lib/models/book_model.dart
class Book {
  final String id;
  final String title;
  final String author;
  final String coverImageUrl;
  final double price;
  final int pages;
  final String category;
  final String? description;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverImageUrl,
    required this.price,
    required this.pages,
    required this.category,
    this.description,
  });
}