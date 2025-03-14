import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Mixin Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarExampleScreen(),
    );
  }
}

class CarExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Mixin Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                final car = Car();
                car.startEngine(); 
                car.honk(); 
                car.stopEngine(); 
              },
              child: Text('Run Car Example'),
            ),
          ],
        ),
      ),
    );
  }
}

mixin EngineMixin {
  bool _isEngineOn = false;

  void startEngine() {
    if (!_isEngineOn) {
      _isEngineOn = true;
      print('Двигатель запущен.');
    } else {
      print('Двигатель уже работает.');
    }
  }

  void stopEngine() {
    if (_isEngineOn) {
      _isEngineOn = false;
      print('Двигатель остановлен.');
    } else {
      print('Двигатель уже выключен.');
    }
  }

  bool get isEngineOn => _isEngineOn;
}

mixin HornMixin {
  void honk() {
    print('Бип-бип!');
  }
}

class Car with EngineMixin, HornMixin {
  Car() {
    print('Создан новый автомобиль.');
  }
}