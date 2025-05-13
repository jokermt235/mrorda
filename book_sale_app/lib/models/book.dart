class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final double price;
  final String coverUrl;
  final String category;
  final int pageCount;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.price,
    required this.coverUrl,
    required this.category,
    required this.pageCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      coverUrl: json['coverUrl'] ?? '',
      category: json['category'] ?? '',
      pageCount: json['pageCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'price': price,
      'coverUrl': coverUrl,
      'category': category,
      'pageCount': pageCount,
    };
  }
}
