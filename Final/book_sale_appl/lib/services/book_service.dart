import '../models/book.dart';

class BookService {
  List<Book> getBooks() {
    return [
      Book(
        id: '1',
        title: 'Flutter for Beginners',
        category: 'Programming',
        coverUrl:
            'assets/images/flutter_for_beginners.jpg',
        pages: 250,
        price: 19.99,
        description:
            'An easy-to-follow guide to building beautiful apps with Flutter, even if you are a complete beginner.',
      ),
      Book(
        id: '2',
        title: 'Advanced Dart',
        category: 'Programming',
        coverUrl: 'assets/images/dart.jpg',
        pages: 300,
        price: 24.99,
        description:
            'Master the Dart language with advanced techniques and best practices for building robust applications.',
      ),
      Book(
        id: '3',
        title: 'The Art of War',
        category: 'History',
        coverUrl: 'assets/images/war.jpg',
        pages: 150,
        price: 9.99,
        description:
            'A timeless military treatise by Sun Tzu, teaching the art of strategic thinking and leadership.',
      ),
      Book(
        id: '4',
        title: 'Cooking Magic',
        category: 'Cooking',
        coverUrl: 'assets/images/cooking.jpg',
        pages: 180,
        price: 14.99,
        description:
            'Discover delightful recipes and secrets to becoming a master chef in your own kitchen!',
      ),
      Book(
        id: '5',
        title: 'Science Wonders',
        category: 'Science',
        coverUrl: 'assets/images/wonders.jpg',
        pages: 220,
        price: 17.49,
        description:
            'Explore the wonders of science with fascinating experiments, theories, and discoveries.',
      ),
      Book(
        id: '6',
        title: 'Mystery of the Old House',
        category: 'Fiction',
        coverUrl: 'assets/images/mystery.jpg',
        pages: 280,
        price: 13.49,
        description:
            'A thrilling mystery novel about an ancient house full of secrets and hidden passages.',
      ),
      Book(
        id: '7',
        title: 'Travel Across Europe',
        category: 'Travel',
        coverUrl: 'assets/images/europe.jpg',
        pages: 350,
        price: 22.90,
        description:
            'Discover the most beautiful places in Europe with inspiring photos and travel guides.',
      ),
      Book(
        id: '8',
        title: 'Mastering Photography',
        category: 'Art',
        coverUrl: 'assets/images/art.jpg',
        pages: 400,
        price: 29.99,
        description:
            'Learn professional photography techniques and tricks to capture stunning images.',
      ),
      Book(
        id: '9',
        title: 'Space Explorers',
        category: 'Science',
        coverUrl: 'assets/images/space_explorers.jpg',
        pages: 260,
        price: 18.99,
        description:
            'A fascinating look at space missions, astronauts, and the mysteries of the universe.',
      ),
      Book(
        id: '10',
        title: 'Healthy Living',
        category: 'Health',
        coverUrl: 'assets/images/healthy_living.jpg',
        pages: 190,
        price: 15.50,
        description:
            'Practical tips for maintaining a healthy lifestyle, including diet and fitness routines.',
      ),
    ];
  }
}
