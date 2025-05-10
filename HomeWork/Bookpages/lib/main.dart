import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'models/book.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Library',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Library')),
      body: BookListScreen(),
    );
  }
}

final bookProvider = FutureProvider<List<Book>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  List<Book> books = [
    Book(
      id: 1,
      title: 'Book 1',
      description: 'This is a description of Book 1.',
      pages: ['Page 1 content', 'Page 2 content', 'Page 3 content'],
    ),
    Book(
      id: 2,
      title: 'Book 2',
      description: 'This is a description of Book 2.',
      pages: ['Page 1 content', 'Page 2 content'],
    ),
    Book(
      id: 3,
      title: 'Book 3',
      description: 'This is a description of Book 3.',
      pages: ['Page 1 content', 'Page 2 content', 'Page 3 content'],
    ),
  ];
  return books;
});

class BookListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksAsync = ref.watch(bookProvider);

    return booksAsync.when(
      data: (books) {
        return GridView.builder(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 0.7,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return GestureDetector(
              onTap:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OpenBookScreen(book: book),
                    ),
                  ),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          book.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          book.description,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}

class OpenBookScreen extends StatefulWidget {
  final Book book;
  OpenBookScreen({required this.book});

  @override
  _OpenBookScreenState createState() => _OpenBookScreenState();
}

class _OpenBookScreenState extends State<OpenBookScreen> {
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < widget.book.pages.length - 1) {
      setState(() {
        _currentPage++;
      });
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.book.title)),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width:
                    double.infinity, // Set the width to take up the full screen
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26)],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.book.pages[_currentPage],
                    style: TextStyle(fontSize: 18, height: 1.5),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _previousPage,
              ),
              IconButton(icon: Icon(Icons.arrow_forward), onPressed: _nextPage),
            ],
          ),
        ],
      ),
    );
  }
}
