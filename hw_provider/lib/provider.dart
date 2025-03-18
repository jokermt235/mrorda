import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends ChangeNotifier {
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
      child: MyApp(),  
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),  
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Consumer<Counter>(
              builder: (context, counter, child) {
                return Text(
                  'Счетчик: ${counter.count}',  
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(height: 30), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,  
              children: [
               IconButton(
                  icon: Icon(Icons.remove, color: const Color.fromARGB(255, 244, 54, 143), size: 40),
                  onPressed: () {
                    context.read<Counter>().decrement(); 
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add, color: const Color.fromARGB(255, 253, 63, 132), size: 40),
                  onPressed: () {
                    context.read<Counter>().increment(); 
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
