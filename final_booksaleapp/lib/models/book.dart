// lib/models/book.dart

class Book {
  final String id;
  final String title;
  final String author;
  final double price;
  final int pages;
  final String coverImageUrl;
  final String category;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.pages,
    required this.coverImageUrl,
    required this.category,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    double? price,
    int? pages,
    String? coverImageUrl,
    String? category,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      price: price ?? this.price,
      pages: pages ?? this.pages,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      category: category ?? this.category,
    );
  }
}