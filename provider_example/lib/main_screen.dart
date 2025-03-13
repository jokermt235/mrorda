import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/counter_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeaea1b),

      /// appbar
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'Counter App Provider',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),

      /// body
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterProvider>(builder: (context, value, child) {
              return Text(
                'Value  ${value.countVal.toString()}',
                style: const TextStyle(
                  fontSize: 80.0,
                  color: Colors.black,
                ),
              );
            }),
            const SizedBox(height: 60.0),
            Consumer<CounterProvider>(builder: (context, value, child){
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      value.add();
                    },
                    backgroundColor: Colors.black,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 80.0),
                  FloatingActionButton(
                    onPressed: () {
                      value.subtract();
                    },
                    backgroundColor: Colors.black,
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}