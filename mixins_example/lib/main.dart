// Mixin to handle device status with a static method
mixin DeviceStatus {
  void logStatus(String status) {
    print("Device Status: $status");
  }

  // Static method to show a global warning about device connectivity
  static void showWarning() {
    print("Warning: Ensure all devices are properly connected!");
  }
}


// class for smart devices
class SmartDevice {
  String name;
  bool isOn = false;

  SmartDevice(this.name);

  void turnOn() {
    isOn = true;
    print("$name is now ON.");
  }

  void turnOff() {
    isOn = false;
    print("$name is now OFF.");
  }
}

// Class for smart light
class SmartLight extends SmartDevice with DeviceStatus {
  String color;

  SmartLight(String name, this.color) : super(name);

  void changeColor(String newColor) {
    color = newColor;
    logStatus("The color of $name is now $color.");
  }
}

// Class for smart thermostat
class SmartThermostat extends SmartDevice with DeviceStatus {
  int temperature;

  SmartThermostat(String name, this.temperature) : super(name);

  void setTemperature(int newTemperature) {
    temperature = newTemperature;
    logStatus("The temperature of $name is set to $temperature°C.");
  }
}

void main() {
  // Create a smart light and smart thermostat objects
  SmartLight livingRoomLight = SmartLight("Living Room Light", "White");
  livingRoomLight.turnOn();
  livingRoomLight.changeColor("Blue");
  livingRoomLight.turnOff();

  SmartThermostat homeThermostat = SmartThermostat("Home Thermostat", 22);
  homeThermostat.turnOn();
  homeThermostat.setTemperature(25);
  homeThermostat.turnOff();

  // Call the static method from the mixin to show a warning
  DeviceStatus.showWarning();
}
