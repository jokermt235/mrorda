class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final String description;
  final double price;
  final int pageCount;
  final List<String> categories;
  final List<String> samplePages;
  int quantity;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.description,
    required this.price,
    required this.pageCount,
    required this.categories,
    required this.samplePages,
    this.quantity = 0,
  });

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? coverUrl,
    String? description,
    double? price,
    int? pageCount,
    List<String>? categories,
    List<String>? samplePages,
    int? quantity,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      coverUrl: coverUrl ?? this.coverUrl,
      description: description ?? this.description,
      price: price ?? this.price,
      pageCount: pageCount ?? this.pageCount,
      categories: categories ?? this.categories,
      samplePages: samplePages ?? this.samplePages,
      quantity: quantity ?? this.quantity,
    );
  }
}