abstract class Vehicle {
  String brand;
  String model;

  Vehicle(this.brand, this.model);

  // method to be overridden
  void startEngine() {
    print('Starting generic engine for $brand $model...');
  }

  // method that derived classes MUST implement
  void performMaintenance();
}

// reusable feature that adds GPS tracking using 'with'.
mixin GpsTrackable {
  void trackLocation(String name) {
    print(' GPS Tracking: Locating $name...');
  }
}

class ElectricCar extends Vehicle {
  ElectricCar(String brand, String model) : super(brand, model);

  // overriding base class method
  @override
  void startEngine() {
    print(' Silent Start: $brand $model is turned on silently.');
  }

  @override
  void performMaintenance() {
    print(' Checking battery health for $brand $model.');
  }
}

class Motorcycle extends Vehicle {
  Motorcycle(String brand, String model) : super(brand, model);

  //overriding base class method
  @override
  void startEngine() {
    print(' VROOM! $brand $model engine roars!');
  }

  @override
  void performMaintenance() {
    print(' Inspecting drive chain for $brand $model.');
  }
}

class DeliveryDrone with GpsTrackable {
  String droneId;

  DeliveryDrone(this.droneId);

  void deliver() {
    trackLocation('Drone $droneId');
    print(' Package delivered!\n');
  }
}

void main() {
  print('=== aclan week 10 activity ===\n');

  ElectricCar myTesla = ElectricCar('Tesla', 'Model 3');
  Motorcycle myYamaha = Motorcycle('Yamaha', 'MT-07');

  // show Inheritance & Polymorphism
  print(' 1. Inheritance & Polymorphism ');
  List<Vehicle> myVehicles = [myTesla, myYamaha];
  for (var v in myVehicles) {
    v.startEngine();
  }

  // show Abstract Class Contract
  print('\n 2. Abstract Class Contract ');
  for (var v in myVehicles) {
    v.performMaintenance(); 
  }

  // show Mixin Usage
  print('\n 3. Mixin Usage ');
  DeliveryDrone myDrone = DeliveryDrone('-01');
  myDrone.deliver();
}
