void main() {
  var horse = Horse('Буцефал');
  var eagle = Eagle('Гром');
  var dolphin = Dolphin('Флиппер');

  horse.run();
  eagle.fly();
  dolphin.swim();

  print('\nИнформация о животных:');
  print(Animal.getInfo(horse));
  horse.makeSound();

  print(Animal.getInfo(eagle));
  eagle.makeSound();

  print(Animal.getInfo(dolphin));
  dolphin.makeSound();

  print('\nВсего создано животных: ${Animal.count}');
}

class Animal {
  String name;

  static int count = 0;

  Animal(this.name) {
    count++;
  }

  static String getInfo(Animal animal) {
    String abilities = '';

    if (animal is Swimmer) abilities += 'умеет плавать, ';
    if (animal is Flyer) abilities += 'умеет летать, ';
    if (animal is Runner) abilities += 'умеет бегать, ';

    return '${animal.name}: ${abilities.isNotEmpty ? abilities.substring(0, abilities.length - 2) : "без особых способностей"}';
  }

  void makeSound() {
    print('$name издает звук');
  }
}

mixin Swimmer {
  void swim() {
    print('Я умею плавать!');
  }
}

mixin Flyer {
  void fly() {
    print('Я умею летать!');
  }
}

mixin Runner {
  void run() {
    print('Я умею бегать!');
  }
}

class Horse extends Animal with Runner {
  Horse(String name) : super(name);

  @override
  void makeSound() {
    print('$name: И-го-го!');
  }
}

class Eagle extends Animal with Flyer {
  Eagle(String name) : super(name);

  @override
  void makeSound() {
    print('$name: Киии!');
  }
}

class Dolphin extends Animal with Swimmer {
  Dolphin(String name) : super(name);

  @override
  void makeSound() {
    print('$name: Иии-иии!');
  }
}
