class Book {
  final String id;
  final String title;
  final String category;
  final String coverUrl;
  final double price;
  final int pages;
  final String previewLink;

  Book({
    required this.id,
    required this.title,
    required this.category,
    required this.coverUrl,
    required this.price,
    required this.pages,
    required this.previewLink,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      coverUrl: json['coverUrl'],
      price: json['price'].toDouble(),
      pages: json['pages'],
      previewLink: json['previewLink'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'coverUrl': coverUrl,
      'price': price,
      'pages': pages,
      'previewLink': previewLink,
    };
  }
}
