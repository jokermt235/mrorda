import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Carousel',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  final List<String> _imagePaths = [
    'image/image1.png',
    'image/image2.png',
    'image/image3.png',
  ];
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < _imagePaths.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Carousel')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _imagePaths.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    _imagePaths[index],
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text('Image not found!',
                          style: TextStyle(color: Colors.red));
                    },
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _imagePaths.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _previousPage,
                child: const Text('Previous'),
              ),
              ElevatedButton(
                onPressed: _nextPage,
                child: const Text('Next'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Slider(
            value: _currentPage.toDouble(),
            min: 0,
            max: (_imagePaths.length - 1).toDouble(),
            divisions: _imagePaths.length - 1,
            onChanged: (value) {
              setState(() {
                _currentPage = value.toInt();
                _pageController.jumpToPage(_currentPage);
              });
            },
          ),
        ],
      ),
    );
  }
}