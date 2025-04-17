final bookProvider = FutureProvider<List<Book>>((ref) async {
  await Future.delayed(Duration(seconds: 2)); // Имитация задержки при загрузке
  List<Book> books = [
    Book(
      title: 'Book 1',
      author: 'Author 1',
      description: 'This is a description of Book 1.',
      pages: ['Page 1 content', 'Page 2 content', 'Page 3 content'],
    ),
    Book(
      title: 'Book 2',
      author: 'Author 2',
      description: 'This is a description of Book 2.',
      pages: ['Page 1 content', 'Page 2 content'],
    ),
    Book(
      title: 'Book 3',
      author: 'Author 3',
      description: 'This is a description of Book 3.',
      pages: ['Page 1 content', 'Page 2 content', 'Page 3 content'],
    ),
  ];
  return books;
});
