import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final double price;
  final int pages;
  final String category;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.price,
    required this.pages,
    required this.category,
  });

  @override
  List<Object> get props => [
    id,
    title,
    author,
    coverUrl,
    price,
    pages,
    category,
  ];

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      title: json['title'] as String,
      author: json['author'] as String,
      coverUrl: json['coverUrl'] as String,
      price: (json['price'] as num).toDouble(),
      pages: json['pages'] as int,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'coverUrl': coverUrl,
      'price': price,
      'pages': pages,
      'category': category,
    };
  }
}
