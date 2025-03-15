import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Counter class that extends ChangeNotifier
class Counter with ChangeNotifier {
  int _count = 0; // Private variable to store the counter value

  int get count => _count; // Getter to access the counter value

  // Method to increment the counter
  void increment() {
    _count++;
    notifyListeners(); // Notify all listeners to update the UI
  }

  // Method to decrement the counter
  void decrement() {
    _count--;
    notifyListeners(); // Notify all listeners to update the UI
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(), // Create an instance of the Counter class
      child: const MyApp(),
    ),
  );
}

// Main app widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

// MyHomePage widget where the counter UI is displayed
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Provider'),
      ),
      body: Center(
        child: Consumer<Counter>(
          builder: (context, counter, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Counter Value: ${counter.count}', // Display the counter value
                  style: const TextStyle(fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add), // Add button to increment
                      onPressed: counter.increment,  
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove), // Remove button to decrement
                      onPressed: counter.decrement,  
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
