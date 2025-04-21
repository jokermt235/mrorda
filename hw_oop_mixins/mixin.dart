mixin PerformanceTracker on VehicleBase {
  void logPerformance(String message) {
    print("Performance Log: $message");
  }

  static void displayNotice() {
    print("This is a static notice: Always check your vehicle's health!");
  }
}

class VehicleBase {
  int maxSpeed = 0;
  int currentSpeed = 0;
}

class Car extends VehicleBase with PerformanceTracker {
  String model;

  Car(this.model, int speedLimit) {
    maxSpeed = speedLimit;
    currentSpeed = 0;
  }

  void accelerate(int increase) {
    if (currentSpeed + increase > maxSpeed) {
      logPerformance("$model cannot go beyond the max speed of $maxSpeed!");
    } else {
      currentSpeed += increase;
      logPerformance("$model is now at $currentSpeed km/h.");
    }
  }

  void brake() {
    currentSpeed = 0;
    logPerformance("$model has stopped.");
  }
}

class Motorbike extends VehicleBase with PerformanceTracker {
  String brand;

  Motorbike(this.brand, int speedLimit) {
    maxSpeed = speedLimit;
    currentSpeed = 0;
  }

  void accelerate(int increase) {
    if (currentSpeed + increase > maxSpeed) {
      logPerformance("$brand cannot exceed $maxSpeed km/h!");
    } else {
      currentSpeed += increase;
      logPerformance("$brand is now riding at $currentSpeed km/h.");
    }
  }

  void stop() {
    currentSpeed = 0;
    logPerformance("$brand has come to a halt.");
  }
}

void main() {
  Car tesla = Car("Tesla Model S", 250);
  tesla.accelerate(100);
  tesla.accelerate(160);
  tesla.brake();

  Motorbike yamaha = Motorbike("Yamaha R1", 180);
  yamaha.accelerate(120);
  yamaha.stop();

  PerformanceTracker.displayNotice();
}