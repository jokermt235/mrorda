import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Slider App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageSliderScreen(),
    );
  }
}

class ImageSliderScreen extends StatefulWidget {
  @override
  _ImageSliderScreenState createState() => _ImageSliderScreenState();
}

class _ImageSliderScreenState extends State<ImageSliderScreen> {
  final CarouselController _controller = CarouselController();
  int _currentIndex = 0;

  final List<String> _imageUrls = [
    'https://via.placeholder.com/400x200/FF5733/FFFFFF?text=Image+1',
    'https://via.placeholder.com/400x200/33FF57/FFFFFF?text=Image+2',
    'https://via.placeholder.com/400x200/3357FF/FFFFFF?text=Image+3',
    'https://via.placeholder.com/400x200/FFFF33/000000?text=Image+4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image Slider with Controllers")),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // Image Slider
          CarouselSlider(
            items: _imageUrls.map((imageUrl) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
            carouselController: _controller,
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

          const SizedBox(height: 20),

          // Next and Previous Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _controller.previousPage(),
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => _controller.nextPage(),
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),

          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _imageUrls.asMap().entries.map((entry) {
              int index = entry.key;
              return GestureDetector(
                onTap: () => _controller.animateToPage(index),
                child: Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
