import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // Define routes
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/mixin': (context) => const MixinExample(),
        '/static': (context) => const StaticExample(),
        '/try_catch': (context) => const TryCatchExample(),
        '/sum': (context) => const SumExample(),
        '/future': (context) => const FutureExample(),
        '/counter_provider': (context) => const CounterProviderExample(),
      },
      initialRoute: '/', // Set the initial route
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            const ImageSlider(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/mixin'),
              child: const Text('Go to Mixin Example'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/static'),
              child: const Text('Go to Static Example'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/try_catch'),
              child: const Text('Go to Try-Catch Example'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/sum'),
              child: const Text('Go to Sum Example'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/future'),
              child: const Text('Go to Future Example'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/counter_provider'),
              child: const Text('Go to Counter Provider Example'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'https://via.placeholder.com/600x400?text=Image+1',
    'https://via.placeholder.com/600x400?text=Image+2',
    'https://via.placeholder.com/600x400?text=Image+3'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList.map((url) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: 1000,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text('Ошибка загрузки изображения'));
                  },
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 400,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => setState(() {
                _currentIndex = entry.key;
              }),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key ? Colors.blue : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// Mixin Example
class MixinExample extends StatelessWidget {
  const MixinExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mixin Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Car myCar = Car();
            myCar.drive();
          },
          child: const Text('Run Mixin Example'),
        ),
      ),
    );
  }
}

mixin Logger {
  void log(String message) {
    print("Log: $message");
  }
}

class Car with Logger {
  void drive() {
    log("Car is driving");
  }
}

// Static Example
class StaticExample extends StatelessWidget {
  const StaticExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Static Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Example.doNothing();
          },
          child: const Text('Run Static Example'),
        ),
      ),
    );
  }
}

class Example {
  static void doNothing() {
    print("This method does nothing.");
  }
}

// Try-Catch Example
class TryCatchExample extends StatelessWidget {
  const TryCatchExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Try-Catch Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              int result = await divide(10, 0);
              print("Result: $result");
            } catch (e) {
              print("Error: $e");
            } finally {
              print("Operation completed.");
            }
          },
          child: const Text('Run Try-Catch Example'),
        ),
      ),
    );
  }
}

Future<int> divide(int a, int b) async {
  await Future.delayed(Duration(seconds: 2));
  if (b == 0) throw Exception("Cannot divide by zero!");
  return a ~/ b;
}

// Sum Example
class SumExample extends StatelessWidget {
  const SumExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            int a = 10;
            int b = 20;
            int sum = a + b;
            print("Sum: $sum");
          },
          child: const Text('Run Sum Example'),
        ),
      ),
    );
  }
}

// Future Example
class FutureExample extends StatelessWidget {
  const FutureExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            List<int> numbers = [1, 2, 3, 4, 5];
            print("Calculating sum...");
            int sum = await delayedSum(numbers);
            print("Sum: $sum");
          },
          child: const Text('Run Future Example'),
        ),
      ),
    );
  }
}

Future<int> delayedSum(List<int> numbers) async {
  int delaySeconds = Random().nextInt(5) + 1;
  await Future.delayed(Duration(seconds: delaySeconds));
  return numbers.reduce((a, b) => a + b);
}

// Counter Provider Example
class CounterProviderExample extends StatelessWidget {
  const CounterProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Provider Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            CounterProvider counterProvider = CounterProvider();
            counterProvider.increment();
            print("Counter: ${counterProvider.count}");
          },
          child: const Text('Run Counter Provider Example'),
        ),
      ),
    );
  }
}

class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}