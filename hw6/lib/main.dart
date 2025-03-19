import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const CounterScreen());
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterProvider>().count.toString(),
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<CounterProvider>().increment(),
                  child: const Text('+'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => context.read<CounterProvider>().reset(),
                  child: const Text('reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
