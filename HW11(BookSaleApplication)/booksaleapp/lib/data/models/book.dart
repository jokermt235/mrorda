class Book {
  final String id;
  final String title;
  final String author;
  final String imageAsset;
  final double price;
  final int totalPages;             
  final String category;
  final String description;
  final List<String> pagesContent;   
  
  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imageAsset,
    required this.price,
    required this.totalPages,
    required this.category,
    required this.description,
    required this.pagesContent,
  });
}