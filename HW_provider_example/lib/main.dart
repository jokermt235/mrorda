// Import necessary packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Define a ChangeNotifier class to manage state
class CounterProvider with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Provider Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Consumer<CounterProvider>(
              builder: (context, counter, child) {
                return Text(
                  counter.count.toString(),
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CounterProvider>().increment(),
                  child: const Text('+'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => context.read<CounterProvider>().decrement(),
                  child: const Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
