mixin SpeedBoost {
  int applyBoost(int speed) {
    return speed + 10;
  }
}

class Vehicle {
  final String model;
  int speed;

  Vehicle(this.model, this.speed);

  void showSpeed() {
    print("$model is moving at $speed km/h.");
  }
}

// SportsCar uses the SpeedBoost mixin to get extra speed
class SportsCar extends Vehicle with SpeedBoost {
  SportsCar(String model, int speed) : super(model, speed);

  void activateNitro() {
    speed = applyBoost(speed); //
    print("$model activated Nitro! New speed: $speed km/h.");
  }
}

void main() {
  var car = SportsCar("Ferrari", 100);
  car.showSpeed();
  car.activateNitro();
}
