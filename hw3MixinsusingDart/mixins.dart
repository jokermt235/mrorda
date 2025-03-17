class Animal {
  void eat() {
    print('Animal is eating...');
  }
}

mixin Swimmer {
  void swim() {
    print('Swimming...');
  }
}

mixin Flyer {
  void fly() {
    print('Flying...');
  }
}

class Duck extends Animal with Swimmer, Flyer {
  void quack() {
    print('Duck is quacking...');
  }
}

class Fish extends Animal with Swimmer {
  void bubble() {
    print('Fish is bubbling...');
  }
}

class Bird extends Animal with Flyer {
  void chirp() {
    print('Bird is chirping...');
  }
}

class Calculator {
  static void doNothing() {
    print('This method does nothing.');
  }

  static int add(int a, int b) {
    return a + b;
  }

  static int multiply(int a, int b) {
    return a * b;
  }
}

void main() {
  Duck duck = Duck();
  duck.eat();
  duck.swim();
  duck.fly();
  duck.quack();

  Fish fish = Fish();
  fish.eat();
  fish.swim();
  fish.bubble();

  Bird bird = Bird();
  bird.eat();
  bird.fly();
  bird.chirp();

  Calculator.doNothing();
  print('2 + 3 = ${Calculator.add(2, 3)}');
  print('2 * 3 = ${Calculator.multiply(2, 3)}');
}