import '../models/book.dart';

class BookRepository {
  Future<List<Book>> fetchBooks() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      Book(
        id: '1',
        title: 'The Time Machine',
        author: 'H.G. Wells',
        image: 'assets/images/time_machine.png',
        price: 12.5,
        pages: 80,
        category: 'Science Fiction',
        description: 'A scientist builds a time machine and explores the future.',
        content: List.generate(10, (i) => 'Chapter ${i + 1}: Content of The Time Machine.'),
      ),
      Book(
        id: '2',
        title: 'Pride and Prejudice',
        author: 'Jane Austen',
        image: 'assets/images/pride_prejudice.png',
        price: 9.0,
        pages: 120,
        category: 'Classics',
        description: 'A romantic novel about manners and marriage.',
        content: List.generate(12, (i) => 'Chapter ${i + 1}: Content of Pride and Prejudice.'),
      ),
      Book(
        id: '3',
        title: 'Moby-Dick',
        author: 'Herman Melville',
        image: 'assets/images/moby_dick.png',
        price: 15.0,
        pages: 200,
        category: 'Classics',
        description: 'A sea adventure about Captain Ahab\'s obsession with a whale.',
        content: List.generate(15, (i) => 'Chapter ${i + 1}: Content of Moby-Dick.'),
      ),
      Book(
        id: '4',
        title: 'Frankenstein',
        author: 'Mary Shelley',
        image: 'assets/images/frankenstein.png',
        price: 11.0,
        pages: 90,
        category: 'Horror',
        description: 'A scientist creates a monster with tragic consequences.',
        content: List.generate(10, (i) => 'Chapter ${i + 1}: Content of Frankenstein.'),
      ),
      Book(
        id: '5',
        title: '1984',
        author: 'George Orwell',
        image: 'assets/images/1984.png',
        price: 13.5,
        pages: 140,
        category: 'Science Fiction',
        description: 'A dystopian novel about totalitarian regime.',
        content: List.generate(12, (i) => 'Chapter ${i + 1}: Content of 1984.'),
      ),
    ];
  }
}