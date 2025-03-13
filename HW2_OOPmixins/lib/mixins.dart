mixin ActivityLogger {
  void recordActivity(String activity) {
    print("Activity recorded: $activity");
  }
}

class Person with ActivityLogger {
  String name;

  Person(this.name);

  void introduce() {
    recordActivity('Introducing myself: My name is $name');
  }
}
