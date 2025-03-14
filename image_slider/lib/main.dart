import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageSliderScreen(),
    );
  }
}

class ImageSliderScreen extends StatelessWidget {
  // Список URL изображений (можно использовать локальные изображения)
  final List<String> imageList = [
    'https://via.placeholder.com/600x400?text=Image+1',
    'https://via.placeholder.com/600x400?text=Image+2',
    'https://via.placeholder.com/600x400?text=Image+3',
    'https://via.placeholder.com/600x400?text=Image+4',
    'https://via.placeholder.com/600x400?text=Image+5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Slider'),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400.0, 
            autoPlay: true, 
            enlargeCenterPage: true, 
            aspectRatio: 16 / 9, 
            autoPlayCurve: Curves.fastOutSlowIn, 
            enableInfiniteScroll: true, 
            autoPlayAnimationDuration: Duration(milliseconds: 800), 
          items: imageList.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}