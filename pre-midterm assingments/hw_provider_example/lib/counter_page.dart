import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Provider Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter:', style: TextStyle(fontSize: 24)),
            Text(
              '${counter.count}',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: counter.decrement,
                  iconSize: 40,
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: counter.increment,
                  iconSize: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}