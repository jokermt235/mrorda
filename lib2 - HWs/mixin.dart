mixin Logger {
  void log(String message) {
    print("Log: $message");
  }
}

class Car with Logger {
  void drive() {
    log("Car is driving");
  }
}

void main() {
  Car myCar = Car();
  myCar.drive();
}
