class Book {
  final String id;
  final String title;
  final String category;
  final String coverUrl;
  final double price;
  final int pages;
  final List<String> samplePages;

  Book({
    required this.id,
    required this.title,
    required this.category,
    required this.coverUrl,
    required this.price,
    required this.pages,
    this.samplePages = const [],
  });
}
