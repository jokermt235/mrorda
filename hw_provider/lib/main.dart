import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Counter with ChangeNotifier {
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
    ChangeNotifierProvider(
      create: (context) => Counter(), 
      child: const MyApp(),
    ),
  );
}

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
                  'Counter Value: ${counter.count}',
                  style: const TextStyle(fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: counter.increment,  
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
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
