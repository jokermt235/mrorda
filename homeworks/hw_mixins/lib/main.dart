import 'package:flutter/material.dart';

mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

mixin Validator {
  bool isValidEmail(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }
}

class User with Logger, Validator {
  String name;
  String email;

  User(this.name, this.email);

  void checkEmail() {
    if (isValidEmail(email)) {
      log('Valid email: $email');
    } else {
      log('Invalid email: $email');
    }
  }
}

class Utils {
  static void doNothing() {}
}

void main() {
  runApp(MyApp());

  User user = User('Kylach', 'test@example.com');
  user.checkEmail();

  Utils.doNothing();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Mixins Example')),
        body: Center(child: Text('Check console for log output')),
      ),
    );
  }
}
