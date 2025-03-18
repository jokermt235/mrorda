import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Carousel',
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Carousel')),
        body: Column(children: [Expanded(child: ImageCarousel())]),
      ),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextImage() {
    if (_currentPage < _images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _pageController.jumpToPage(0);
    }
  }

  void _prevImage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _pageController.jumpToPage(_images.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: null,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index % _images.length;
              });
            },
            itemBuilder: (context, index) {
              final actualIndex = index % _images.length;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(_images[actualIndex], fit: BoxFit.cover),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_images.length, (index) {
            return Container(
              margin: const EdgeInsets.all(4.0),
              width: _currentPage == index ? 12.0 : 8.0,
              height: _currentPage == index ? 12.0 : 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Colors.deepPurple : Colors.grey,
              ),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _prevImage,
                child: const Text('Previous Image'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: _nextImage,
                child: const Text('Next Image'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
