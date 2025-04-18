import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/book_provider.dart';

void main() {
  runApp(const ProviderScope(child: BookApp()));
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Reader',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8EFE5), // светло-коричневый фон
        primaryColor: const Color(0xFF6B4F3B), // темно-коричневый
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6B4F3B),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 22,
            fontFamily: 'Georgia',
            color: Color(0xFF4E342E), // глубокий коричневый
            height: 1.5,
          ),
        ),
      ),
      home: const BookReaderPage(),
    );
  }
}

class BookReaderPage extends ConsumerWidget {
  const BookReaderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageText = ref.watch(currentPageTextProvider);
    final currentPage = ref.watch(currentPageProvider);
    final book = ref.watch(currentBookProvider);

    void goToNextPage() {
      if (currentPage < book.pages.length - 1) {
        ref.read(currentPageProvider.notifier).state++;
      }
    }

    void goToPreviousPage() {
      if (currentPage > 0) {
        ref.read(currentPageProvider.notifier).state--;
      }
    }

    return GestureDetector(
      onTapUp: (details) {
        final width = MediaQuery.of(context).size.width;
        final tapX = details.globalPosition.dx;

        if (tapX < width / 2) {
          goToPreviousPage();
        } else {
          goToNextPage();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(book.title),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Center(
            child: SingleChildScrollView(
              child: Text(
                pageText,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFF6B4F3B),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Page ${currentPage + 1} of ${book.pages.length}',
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
