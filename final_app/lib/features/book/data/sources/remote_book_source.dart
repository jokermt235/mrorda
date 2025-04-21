import '/features/book/data/models/book_model.dart';

abstract class RemoteBookSource {
  Future<List<Book>> fetchBooks();
}

class RemoteBookSourceImpl implements RemoteBookSource {
  @override
Future<List<Book>> fetchBooks() async {
  await Future.delayed(const Duration(seconds: 1));
  
  return [
    Book(
      id: '1',
      title: 'Flutter in Action',
      author: 'Eric Windmill',
      coverUrl: 'https://m.media-amazon.com/images/I/61kDv0tC-IL._SY425_.jpg',
      description: 'Flutter in Action teaches you to build professional-quality mobile applications using the Flutter SDK and the Dart programming language.',
      price: 39.99,
      pageCount: 320,
      categories: ['Programming', 'Mobile', 'Flutter'],
      samplePages: [
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/9c9c8c1e-9b0b-4a0a-8e0e-5e5e5e5e5e5e._SY300_.jpg',
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/9c9c8c1e-9b0b-4a0a-8e0e-5e5e5e5e5e5e._SY300_.jpg',
      ],
    ),
    Book(
      id: '2',
      title: 'Dart in Depth',
      author: 'John Smith',
      coverUrl: 'https://m.media-amazon.com/images/I/51+Jk5cZcZL._SY425_.jpg',
      description: 'Deep dive into Dart programming language with advanced concepts and practical examples.',
      price: 29.99,
      pageCount: 250,
      categories: ['Programming', 'Dart'],
      samplePages: [
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/9c9c8c1e-9b0b-4a0a-8e0e-5e5e5e5e5e5e._SY300_.jpg',
      ],
    ),
    Book(
      id: '3',
      title: 'The Complete Cookbook',
      author: 'Julia Child',
      coverUrl: 'https://m.media-amazon.com/images/I/81yI1R+NGaL._SY425_.jpg',
      description: 'Master the art of cooking with this comprehensive guide covering techniques from around the world.',
      price: 35.50,
      pageCount: 480,
      categories: ['Cooking', 'Food'],
      samplePages: [
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/9c9c8c1e-9b0b-4a0a-8e0e-5e5e5e5e5e5e._SY300_.jpg',
      ],
    ),
    Book(
      id: '4',
      title: 'Gardening for Beginners',
      author: 'Alan Titchmarsh',
      coverUrl: 'https://m.media-amazon.com/images/I/81V9X+6fXJL._SY425_.jpg',
      description: 'A practical guide to starting your own garden, with tips for all seasons.',
      price: 24.99,
      pageCount: 180,
      categories: ['Gardening', 'Hobby'],
      samplePages: [
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/9c9c8c1e-9b0b-4a0a-8e0e-5e5e5e5e5e5e._SY300_.jpg',
      ],
    ),
    Book(
      id: '5',
      title: 'History of Ancient Rome',
      author: 'Mary Beard',
      coverUrl: 'https://m.media-amazon.com/images/I/81V9X+6fXJL._SY425_.jpg',
      description: 'A comprehensive look at the rise and fall of the Roman Empire.',
      price: 28.75,
      pageCount: 420,
      categories: ['History', 'Non-fiction'],
      samplePages: [
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/9c9c8c1e-9b0b-4a0a-8e0e-5e5e5e5e5e5e._SY300_.jpg',
      ],
    ),
    Book(
      id: '6',
      title: 'Modern JavaScript',
      author: 'Sarah Connor',
      coverUrl: 'https://m.media-amazon.com/images/I/81V9X+6fXJL._SY425_.jpg',
      description: 'Learn modern JavaScript features and best practices for web development.',
      price: 32.99,
      pageCount: 350,
      categories: ['Programming', 'Web'],
      samplePages: [
        'https://m.media-amazon.com/images/S/aplus-media-library-service-media/9c9c8c1e-9b0b-4a0a-8e0e-5e5e5e5e5e5e._SY300_.jpg',
      ],
    ),
  ];
}
}