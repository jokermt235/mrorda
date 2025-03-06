class Human{

  Human(this.height);
  int height;
  int _getHeightWithFactor(){
    return height * 2;
  }
  
  int getHeight(){
    return height;
  }
}

class Adult extends Human{

  int getHeightWithOtherFactor(){
    return _getHeightWithFactor() - 2;
  }
}

class Car {

  final String model;
  Car(this.model);
  factory Car.create(String type) {
    if (type == 'sport') {
      return Car('Porsche 911');
    } else if (type == 'sedan') {
      return Car('Toyota Camry');
    }
    return Car('Unknown');
  }
}

class Animal {

  final String model;
  String? sharpTeeth;
  Animal(this.model,this.sharpTeeth);
  factory Animal.create(String type) {
    if (type == 'wild') {
      var animal = Animal('wild', 'Yes');
      return animal;
    } else if (type == 'domastic') {
      return Animal('Domastic', 'No');
    }
    return Animal('Unknown', 'No');
  }
}

void main() {

  var car1 = Car.create('sport');
  var animal1 = Animal.create('wild');
  var animal2 = Animal.create('domastic');
  print(animal1.model);
  print(animal1.sharpTeeth);
  print(animal2.model);
  print(animal2.sharpTeeth);
  print(car1.model);
  print("The height is:");
  print(adult._getHeightWithFactor());
}