import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const ImageCarousel(),
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
  late PageController _controller;
  final List<String> _images = [
    'assets/1.jpeg',
    'assets/2.jpeg',
    'assets/3.jpeg',
    'assets/4.jpeg',
    'assets/5.jpeg',
  ];
  int _currentPage = 1000;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              int realIndex = index % _images.length;
              return Image.asset(
                _images[realIndex],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _images.length,
                (index) => Container(
              margin: const EdgeInsets.all(5),
              width: _currentPage % _images.length == index ? 12 : 8,
              height: _currentPage % _images.length == index ? 12 : 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage % _images.length == index
                    ? Colors.blue
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}