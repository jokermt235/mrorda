import 'package:equatable/equatable.dart';

class Book extends Equatable {
  final int id;
  final String title;
  final String author;
  final String coverUrl;
  final double price;
  final int pageCount;
  final String description;
  final String category;
  final double rating;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.price,
    required this.pageCount,
    required this.description,
    required this.category,
    required this.rating,
  });

  @override
  List<Object> get props => [
        id,
        title,
        author,
        coverUrl,
        price,
        pageCount,
        description,
        category,
        rating
      ];

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      coverUrl: json['coverUrl'],
      price: json['price'].toDouble(),
      pageCount: json['pageCount'],
      description: json['description'],
      category: json['category'],
      rating: json['rating'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'coverUrl': coverUrl,
      'price': price,
      'pageCount': pageCount,
      'description': description,
      'category': category,
      'rating': rating,
    };
  }
}
