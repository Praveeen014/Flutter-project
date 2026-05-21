void main() {
  // Variables & Data Types
  int age = 20;
  double price = 9.99;
  String name = 'Riya';
  bool isOpen = true;
  var greeting = 'Hello';

  print('$greeting, $name! Age=$age Price=$price Open=$isOpen');

  // Operators
  int nextAge = age + 1;
  double discount = price * 0.9;
  bool canBuy = price < 10 && isOpen;
  print('nextAge=$nextAge discount=$discount canBuy=$canBuy');

  // Functions
  print(greet(name));
  print(add(2, 3));
  print(describe('Dart'));

  // Condition
  if (age >= 18) {
    print('You are an adult.');
  } else {
    print('You are a minor.');
  }

  // Null Safety
  String? nickname;
  String displayName = nickname ?? name;
  print('displayName = $displayName');

  // List
  List<String> fruits = ['Apple', 'Banana'];
  fruits.add('Mango');
  print('Fruits: $fruits');

  // Map
  Map<String, String> user = {'name': name, 'role': 'student'};
  user['city'] = 'Delhi';
  print('User: $user');

  // Set
  Set<int> ids = {1, 2};
  ids.add(3);
  print('IDs: $ids');

  // Spread
  List<String> moreFruits = ['Kiwi', ...fruits];
  print('More fruits: $moreFruits');

  // OOP
  Animal animal = Dog('Spot');
  animal.makeSound();

  Person person = Student('Asha', 18, 'Math');
  person.describe();

  // Encapsulation
  BankAccount account = BankAccount('Asha', 100);
  account.deposit(50);
  print('Balance: ${account.balance}');
  account.withdraw(30);
  print('Balance after withdraw: ${account.balance}');

  // Interface
  Printable report = Student('Asha', 18, 'Math');
  report.printInfo();
}

// Functions
String greet(String name) => 'Hi, $name!';
int add(int a, int b) => a + b;

String describe(String subject, {String language = 'Dart'}) {
  return '$subject is written in $language.';
}

// Abstraction
abstract class Animal {
  void makeSound();
}

class Dog extends Animal {
  final String name;
  Dog(this.name);

  @override
  void makeSound() {
    print('$name says: Woof!');
  }
}

// Interface
abstract class Printable {
  void printInfo();
}

// Inheritance
abstract class Person implements Printable {
  final String name;
  final int age;

  Person(this.name, this.age);

  void describe() {
    print('$name is $age years old.');
  }

  @override
  void printInfo() {
    print('Person: $name, age $age');
  }
}

class Student extends Person {
  final String subject;

  Student(String name, int age, this.subject) : super(name, age);

  @override
  void describe() {
    print('$name is $age and studies $subject.');
  }

  @override
  void printInfo() {
    print('Student: $name, age $age, subject $subject');
  }
}

// Encapsulation
class BankAccount {
  final String owner;
  double _balance;

  BankAccount(this.owner, this._balance);

  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
    }
  }
}
