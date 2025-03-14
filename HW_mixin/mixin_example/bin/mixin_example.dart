mixin LoggerMixin {
  void logInfo(String message) {
    print("INFO: $message");
  }

  void logWarning(String message) {
    print("WARNING: $message");
  }
}

class MyClass with LoggerMixin {
  void doSomething() {
    logInfo("This is an info message from MyClass.");
    logWarning("This is a warning message from MyClass.");
  }
}

// Static Method Example in Dart
class Utility {
  static void printMessage() {
    print("This is a static method.");
  }
}

void main() {
  print("Main function started.");

  // Creating an instance of MyClass to use mixin methods
  MyClass obj = MyClass();
  obj.doSomething();

  // The static method is NOT executed automatically.
  // Uncomment the next line to call the static method:
  // Utility.printMessage();

  print("Main function ended.");
}
