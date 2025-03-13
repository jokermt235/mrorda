import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ImageSliderPage());
  }
}

class ImageSliderPage extends StatefulWidget {
  @override
  _ImageSliderPageState createState() => _ImageSliderPageState();
}

class _ImageSliderPageState extends State<ImageSliderPage> {
  PageController _pageController = PageController();

  List<String> images = [
    'https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png',
    'https://upload.wikimedia.org/wikipedia/commons/f/f9/Phoenicopterus_ruber_in_S%C3%A3o_Paulo_Zoo.jpg',
    'https://canto-wp-media.s3.amazonaws.com/app/uploads/2019/07/19194551/how-to-make-a-url-for-a-picture-on-your-computer-4.jpg',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageController.page?.toInt() != images.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_pageController.page?.toInt() != 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Slider')),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(images[index], fit: BoxFit.cover);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _previousPage,
                  child: Text('Previous'),
                ),
                SizedBox(width: 20),
                ElevatedButton(onPressed: _nextPage, child: Text('Next')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
