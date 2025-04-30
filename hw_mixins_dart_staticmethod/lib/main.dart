import 'package:flutter/material.dart';

mixin User {
  String getUserInfo(String username, String email) {
    return "Username: $username\nEmail: $email";
  }
}

mixin Admin {
  String getAdminInfo(String adminRole) {
    return "Admin Role: $adminRole";
  }
}

class Logger {
  static void log(String message) {
    print("LOG: $message");
  }
}

class UserProfile with User, Admin {
  String username;
  String email;
  String adminRole;

  UserProfile(this.username, this.email, this.adminRole);

  String getUserProfileInfo() {
    return getUserInfo(username, email) + '\n' + getAdminInfo(adminRole);
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Mixin Example', home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProfile = UserProfile("turatbek", "turatbek@icloud.com", "Admin");

    return Scaffold(
      appBar: AppBar(title: Text("Flutter Mixin")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userProfile.getUserProfileInfo(),
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
