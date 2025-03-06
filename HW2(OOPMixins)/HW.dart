/*Dinaiym*/
/*1st code
mixin Logger {
  void log(String message){
    print(message);
}
}

class BankAcc with Logger {
    double _balance = 0.0;
void deposit(double amount){
    if(amount > 0){
   _balance += amount;
log("Fixed your money!");
}else{
  print("Not enough, give more money!");
}

}
void withdraw(amount){
    if(amount > 0 && _balance >= amount){
   log("You can take your money!");
}else{
    print("No money, bye!")
}
}
void checkBalance{
double outputBalance = _balance.toStringAsFixed(2);
    print("Current balance  $ouputBalance");
}
}

void main() {
  var account = BankAcc();
  account.deposit(1500.0);
  account.checkBalance();

  account.withdraw(200.0);
  account.checkBalance();

  account.withdraw(600.0);  
  account.checkBalance();
}*/

/*Dinaiym*/
/*2nd code*/
class TankBase {
   int fuelCapacity = 0;
   int currFuel = 0;
}
mixin FuelCapacity on TankBase{
   void refuel(int amount){
if(currFuel + amount > fuelCapacity){
  print("Is Full");
}else{
  currFuel += amount;
print("Added");
}
}
}
class Tank extends TankBase with FuelCapacity{
   Tank(int capacity){
        fuelCapacity = capacity;
        currFuel = 0;
    }
}
class Airplane extends TankBase with FuelCapacity{
      String model;
Airplane(this.model, int capacity){
  fuelCapacity = capacity;
currFuel = 0;
}
void fly(int dist){
   int fuelNeed = dist ~/ 100;
if(fuelNeed > currFuel){
print("Not enough fuel!");
}else{
print("All okay! Good luck!");
}
}
}
void main(){
     Airplane xxx = Airplane("XXX model", 10000);
xxx.refuel(5000);
xxx.fly(2300);
xxx.refuel(100000);
xxx.fly(20000);
}