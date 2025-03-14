mixin Swimmer {
  void swim() {
    print('Swimming...');
  }
}

class Animal {
  void breathe() {
    print('Breathing...');
  }
}

class Fish extends Animal with Swimmer {
  void swimInWater() {
    swim();
  }
}

class Human extends Animal with Swimmer {
  void swimInPool() {
    swim();
  }
}

void main() {
  var fish = Fish();
  fish.swimInWater();

  var human = Human();
  human.swimInPool();
}
