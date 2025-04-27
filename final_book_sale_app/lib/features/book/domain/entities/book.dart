class Book {
  final String id;
  final String title;
  final String author;
  final String coverImage;
  final String category;
  final double price;
  final int pageCount;
  final String description;
  final List<String> samplePages;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverImage,
    required this.category,
    required this.price,
    required this.pageCount,
    required this.description,
    required this.samplePages,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'] ?? '1',
      title: json['title'],
      author: json['author'],
      coverImage: json['coverImage'],
      category: json['category'],
      price: json['price'].toDouble(),
      pageCount: json['pageCount'],
      description: json['description'],
      samplePages: json['samplePages'] is List
          ? List<String>.from(json['samplePages'] ?? [])
          : [],
    );
  }
}