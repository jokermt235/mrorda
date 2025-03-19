import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Mixin 1: AuthMixin
mixin AuthMixin {
  bool isAuthenticated = false;

  void login(String username, String password) {
    if (username == "user" && password == "password") {
      isAuthenticated = true;
      if (kDebugMode) {
        print("User logged in!");
      }
    } else {
      if (kDebugMode) {
        print("Invalid credentials.");
      }
    }
  }

  bool checkAuthentication() {
    return isAuthenticated;
  }
}

// Mixin 2: ValidationMixin
mixin ValidationMixin {
  bool isValidEmail(String email) {
    final regex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    return regex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }
}

// Main class using both mixins
class MyClass with AuthMixin, ValidationMixin {
  void performLogin(String username, String password) {
    if (checkAuthentication()) {
      if (kDebugMode) {
        print("Already logged in.");
      }
    } else {
      login(username, password);
    }
  }

  void performValidation(String email, String password) {
    if (isValidEmail(email) && isValidPassword(password)) {
      if (kDebugMode) {
        print("Valid email and password.");
      }
    } else {
      if (kDebugMode) {
        print("Invalid email or password.");
      }
    }
  }
}

// Flutter UI to interact with the logic
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyClass myObject = MyClass();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Mixin Example - Auth and Validation"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              String email = "test@example.com";
              String password = "password";

              // Perform validation
              myObject.performValidation(email, password);

              // Simulate login
              myObject.performLogin("user", "password");
            },
            child: Text("Login & Validate"),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
