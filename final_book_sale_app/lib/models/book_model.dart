class Book {
  final String id;
  final String title;
  final String category;
  final String imageUrl;
  final int pages;
  final double price;

  Book({
    required this.id,
    required this.title,
    required this.category,
    required this.imageUrl,
    required this.pages,
    required this.price,
  });

  static Book empty() => Book(
    id: "",
    title: "",
    category: "",
    imageUrl: "",
    pages: 0,
    price: 0.0,
  );

  // Чтобы использовать Book как ключ в Map
  @override
  bool operator ==(Object other) => other is Book && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
