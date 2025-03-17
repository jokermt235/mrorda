void main() {
  var dog = Dog('Шарик');
  var duck = Duck('Дональд');
  var cat = Cat('Мурзик');

  dog.run();
  dog.swim();

  duck.fly();
  duck.swim();

  cat.run();

  print('\nИнформация о животных:');
  print(Animal.getInfo(dog));
  dog.makeSound();

  print(Animal.getInfo(duck));
  duck.makeSound();

  print(Animal.getInfo(cat));
  cat.makeSound();

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

class Dog extends Animal with Runner, Swimmer {
  Dog(String name) : super(name);

  @override
  void makeSound() {
    print('$name: Гав-гав!');
  }
}

class Duck extends Animal with Flyer, Swimmer {
  Duck(String name) : super(name);

  @override
  void makeSound() {
    print('$name: Кря-кря!');
  }
}

class Cat extends Animal with Runner {
  Cat(String name) : super(name);

  @override
  void makeSound() {
    print('$name: Мяу-мяу!');
  }
}
