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

class Truck extends VehicleBase with PerformanceTracker {
  String brand;
  int cargoCapacity;
  int currentLoad = 0;

  Truck(this.brand, int speedLimit, this.cargoCapacity) {
    maxSpeed = speedLimit;
    currentSpeed = 0;
  }

  void accelerate(int increase) {
    if (currentSpeed + increase > maxSpeed) {
      logPerformance("$brand cannot exceed its max speed of $maxSpeed km/h!");
    } else {
      currentSpeed += increase;
      logPerformance("$brand is now moving at $currentSpeed km/h.");
    }
  }

  void brake() {
    currentSpeed = 0;
    logPerformance("$brand has come to a full stop.");
  }

  void loadCargo(int weight) {
    if (currentLoad + weight > cargoCapacity) {
      logPerformance("$brand cannot carry more than $cargoCapacity kg!");
    } else {
      currentLoad += weight;
      logPerformance(
        "$brand has loaded $weight kg. Current load: $currentLoad kg.",
      );
    }
  }

  void unloadCargo(int weight) {
    if (currentLoad - weight < 0) {
      logPerformance("$brand has no enough cargo to unload!");
    } else {
      currentLoad -= weight;
      logPerformance(
        "$brand has unloaded $weight kg. Remaining load: $currentLoad kg.",
      );
    }
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
  Truck volvo = Truck("Volvo FH16", 120, 20000);
  volvo.accelerate(80);
  volvo.loadCargo(5000);
  volvo.loadCargo(17000);
  volvo.unloadCargo(7000);
  volvo.brake();

  Motorbike yamaha = Motorbike("Yamaha R1", 180);
  yamaha.accelerate(120);
  yamaha.stop();

  PerformanceTracker.displayNotice();
}
