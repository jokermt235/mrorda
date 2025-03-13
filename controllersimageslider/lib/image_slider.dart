import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final CarouselController _controller = CarouselController(); // Make sure to use CarouselController()
  int _currentIndex = 0;

  final List<String> imgList = [
    'https://via.placeholder.com/600x400/FF5733/FFFFFF?text=Image1',
    'https://via.placeholder.com/600x400/33FF57/FFFFFF?text=Image2',
    'https://via.placeholder.com/600x400/3357FF/FFFFFF?text=Image3',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList.map((item) {
            return Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(item),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          carouselController: _controller, // Use the controller to manage carousel
          options: CarouselOptions(
            height: 250.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key ? Colors.blue : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _controller.previousPage(), // Go to the previous page
              child: Text('Previous'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => _controller.nextPage(), // Go to the next page
              child: Text('Next'),
            ),
          ],
        ),
      ],
    );
  }
}
