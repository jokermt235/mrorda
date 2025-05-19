import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'provider.dart';

class BookReader extends ConsumerStatefulWidget {
  const BookReader({Key? key}) : super(key: key);

  @override
  ConsumerState<BookReader> createState() => _BookReaderState();
}

class _BookReaderState extends ConsumerState<BookReader> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    final currentPage = ref.read(currentPageProvider);
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    ref.read(currentPageProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    final pages = ref.watch(bookPagesProvider);
    final currentPage = ref.watch(currentPageProvider);

    void goToPage(int page) {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      ref.read(currentPageProvider.notifier).state = page;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Page ${currentPage + 1}')),
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(pages[index], style: const TextStyle(fontSize: 18)),
          );
        },
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: currentPage > 0 ? () => goToPage(currentPage - 1) : null,
            child: const Text('back'),
          ),
          TextButton(
            onPressed:
                currentPage < pages.length - 1
                    ? () => goToPage(currentPage + 1)
                    : null,
            child: const Text('next'),
          ),
        ],
      ),
    );
  }
}
