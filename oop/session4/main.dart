/*
!=====================================================
! Session 4 – OOP Concepts 
!=====================================================

? Topics covered in this file:
!1) Constructors in Dart
*   - Default constructor
*   - Parameterized constructor
*   - Named constructor
*   - Factory constructor
*
!2) Encapsulation in Dart
*   - Private variables
*   - Public getters
*   - Controlled setters (methods)
*
!3) Inheritance in Dart
*   - extends keyword
*   - super keyword (intro)
*   - Method overriding
*
!4) OOP Relationships (Conceptual)
*   - Association
*   - Aggregation
*   - Composition
?=====================================================
*/

void main() {
  print('========= SESSION 4 =========\n');

  testConstructors();
  testEncapsulation();
  testInheritance();
  testOopRelations();

  print('\n========= END OF SESSION =========');
}

/*
!--------------------------------------------------
! 1) CONSTRUCTORS IN DART
!--------------------------------------------------
*/

class Person {
  String name;
  int age;

  //? Parameterized constructor
  // Used to initialize object with values
  Person(this.name, this.age);

  //? Named constructor
  // Used to create object with specific logic
  Person.adult(this.name) : age = 21;

  //? Factory constructor
  // Can return existing or new object
  factory Person.createAdult(String name) {
    return Person(name, 18);
  }

  @override
  String toString() {
    return 'Person(name: $name, age: $age)';
  }
}

void testConstructors() {
  print('\n--- Constructors ---');

  Person p1 = Person('Ahmed', 20);
  Person p2 = Person.adult('Mohamed');
  Person p3 = Person.createAdult('Ali');

  print(p1.toString());
  print(p2.toString());
  print(p3.toString());
}

/*
!--------------------------------------------------
! 2) ENCAPSULATION IN DART
!--------------------------------------------------
? Encapsulation = Hiding data & controlled access
? Achieved using:
* - Private variables (_)
* - Public getters & methods
*/

//? Example: BankAccount class applying encapsulation
class BankAccount {
  String currency; // public
  String _accountNumber; // private
  double _balance = 0; // private

  BankAccount(
    this._accountNumber, {
    double initialBalance = 0,
    this.currency = 'USD',
  }) {
    _balance = initialBalance;
  }

  //? Getter (read-only access)
  double get balance => _balance;

  String get accountNumber => _accountNumber;

  //? Controlled modification (setter-like behavior)
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  bool withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      return true;
    }
    return false;
  }
}

void testEncapsulation() {
  print('\n--- Encapsulation ---');

  BankAccount account = BankAccount('123456789', initialBalance: 1000);

  print('Account Number: ${account.accountNumber}'); //getter
  print('Balance: ${account.balance} ${account.currency}');

  account.deposit(500);
  print('After deposit: ${account.balance}');

  bool success = account.withdraw(300);
  print(success ? 'After withdrawal: ${account.balance}' : 'Withdrawal failed');
}

/*
!--------------------------------------------------
! 3) INHERITANCE IN DART
!--------------------------------------------------
? Inheritance allows a class to reuse another class
? Uses:
* - extends keyword
* - method overriding
*/

class Animal {
  void speak() {
    print('Animal speaks');
  }
}

class Dog extends Animal {
  @override
  void speak() {
    print('Dog barks');
  }
}

class Cat extends Animal {
  @override
  void speak() {
    print('Cat meows');
  }
}

void testInheritance() {
  print('\n--- Inheritance ---');

  Animal myDog = Dog();
  Animal myCat = Cat();

  myDog.speak(); // Dog barks
  myCat.speak(); // Cat meows
}

/*
!--------------------------------------------------
! 4) OOP RELATIONSHIPS (CONCEPTUAL)
!--------------------------------------------------
*/

void testOopRelations() {
  print('\n--- OOP Relationships ---');

  /*
   ? Association:
   * A uses B (no ownership)
   * Example: Teacher → Student

   ? Aggregation:
   * A has B (weak ownership)
   * B can exist without A
   * Example: Team → Player

   ? Composition:
   * A owns B (strong ownership)
   * B cannot exist without A
   * Example: House → Room
  */

  print('Association=> weak connection');
  print('Aggregation=> has-a (weak ownership)');
  print('Composition=> has-a (strong ownership)');
}
