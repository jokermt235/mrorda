class Book {
  final String id;
  final String title;
  final String author;
  final String image;
  final double price;
  final int pages;
  final String category;
  final String description;
  final List<String> content;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.price,
    required this.pages,
    required this.category,
    required this.description,
    required this.content,
  });
}