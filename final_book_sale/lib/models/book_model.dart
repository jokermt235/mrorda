class Book {
  final String id;
  final String title;
  final String coverUrl;
  final int pages;
  final double price;
  final String category;

  Book({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.pages,
    required this.price,
    required this.category,
  });

  // ADD THIS:
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] as String,
      title: json['title'] as String,
      coverUrl: json['coverUrl'] as String,
      pages: json['pages'] as int,
      price: (json['price'] as num).toDouble(),
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'coverUrl': coverUrl,
      'pages': pages,
      'price': price,
      'category': category,
    };
  }
}
