import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class BookModel extends Equatable {
  final String id;
  final String title;
  final String author;
  final String description;
  final double price;
  final int pages;
  final String category;
  final String imageUrl;
  final double rating;
  final bool isNewYorkTimesBestseller;

  static final Uuid _uuid = Uuid(); // ✅ Создаем один экземпляр Uuid

  BookModel({
    String? id,
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.pages,
    required this.category,
    required this.imageUrl,
    this.rating = 0.0,
    this.isNewYorkTimesBestseller = false,
  }) : id = id ?? _uuid.v4(); // ✅ Генерация UUID если не передан

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      pages: json['pages'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      rating: (json['rating'] as num).toDouble(),
      isNewYorkTimesBestseller: json['isNewYorkTimesBestseller'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'price': price,
      'pages': pages,
      'category': category,
      'imageUrl': imageUrl,
      'rating': rating,
      'isNewYorkTimesBestseller': isNewYorkTimesBestseller,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        description,
        price,
        pages,
        category,
        imageUrl,
        rating,
        isNewYorkTimesBestseller,
      ];
}
