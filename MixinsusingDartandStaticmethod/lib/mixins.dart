// Define a Mixin to add extra functionality
mixin LoggerMixin {
  void log(String message) {
    print("Log: $message");
  }
}

class MyClass with LoggerMixin {
  String name;

  MyClass(this.name);

  void greet() {
    log('Hello from MyClass, my name is $name');
  }
}

// Class with a static method
class MathUtils {
  static int add(int a, int b) {
    return a + b;
  }

  static int multiply(int a, int b) {
    return a * b;
  }
}
