/*
!=====================================================
! Session 5 – OOP Concepts 
!=====================================================

? Topics covered in this file:
!1) Polymorphism in Dart
*   - Method overriding
*   - Runtime polymorphism
*
!2) Abstraction, Interfaces & Mixins
*   - Abstract classes & methods
*   - Concrete classes
*   - Interfaces using implements
*   - Multiple interfaces
*   - Mixins & mixin constraints
*   - When to use each
*
!3) Enums in Dart
*   - Basic enums
*   - Enhanced enums
*   - Avoiding magic numbers
*
!4) Async Programming (Intro)
*   - Future
*   - async / await
*   - .then()
*
!5) Exception Handling
*   - try / catch / finally
*   - throw
*   - Custom exceptions
?=====================================================
*/

void main() {
  print('========= SESSION 5 =========\n');

  testPolymorphism();
  testAbstractionAndInterfaces();
  testMixins();
  testEnums();
  testAsync();
  testExceptions();

  print('\n========= END OF SESSION =========');
}

/*
!--------------------------------------------------
! 1) POLYMORPHISM IN DART
!--------------------------------------------------
? Polymorphism = same method name, different behavior
? Achieved=> using method overriding
*/

class Shape {
  void draw() {
    print('Drawing shape');
  }
}

class Circle extends Shape {
  @override
  void draw() {
    print('Drawing circle');
  }
}

class Rectangle extends Shape {
  @override
  void draw() {
    print('Drawing rectangle');
  }
}

void testPolymorphism() {
  print('\n--- Polymorphism ---');

  Shape s1 = Circle();
  Shape s2 = Rectangle();

  s1.draw(); // Circle behavior
  s2.draw(); // Rectangle behavior
}

/*
!--------------------------------------------------
! 2) ABSTRACTION & INTERFACES
!--------------------------------------------------
? Abstract class:
* - Can contain abstract & concrete methods
* - Cannot be instantiated
*/

abstract class Vehicle {
  void move(); //* abstract method

  void start() {
    print('Vehicle started'); //* concrete method
  }
}

class Car extends Vehicle {
  @override
  void move() {
    // must implement abstract method
    print('Car is moving');
  }
}

/*
? Interface in Dart:
* - Created using abstract class
* - Implemented using implements keyword
* - All methods must be implemented (abstract and concrete)
*/

abstract class Flyable {
  void fly();
}

abstract class Swimmable {
  void swim();
}

// Implementing multiple interfaces
class Duck implements Flyable, Swimmable {
  @override
  void fly() {
    // must implement all methods because of implements keyword
    print('Duck is flying');
  }

  @override
  void swim() {
    // must implement all methods because of implements keyword
    print('Duck is swimming');
  }
}

void testAbstractionAndInterfaces() {
  print('\n--- Abstraction & Interfaces ---');

  Vehicle car = Car();
  car.start(); // concrete method from abstract class
  car.move(); // implemented abstract method

  Duck duck = Duck();
  duck.fly(); // implemented method from Flyable
  duck.swim(); // implemented method from Swimmable
}

/*
!--------------------------------------------------
! 3) MIXINS IN DART
!--------------------------------------------------
? Mixin:
* - Reuse code across classes
* - No constructor
* - Can contain concrete methods & properties
* - Can be applied to multiple classes
* - Uses with keyword
*/

mixin Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

class Service with Logger {
  void execute() {
    log('Service executed'); // using mixin method
  }
}

void testMixins() {
  print('\n--- Mixins ---');

  Service service = Service();
  service.execute();
}

/*
? When to use each (Simple & Practical Explanation)

? Abstract Class
*  → Use it when classes are RELATED and share:
*    - common behavior (implemented methods)
*    - common structure (fields / base logic)
*  → Acts as a "base class"
*
? Example idea:
*  Vehicle → Car, Bike, Truck
*  (All vehicles move, but each moves differently)

? Interface
*  → Use it when you only care about WHAT a class can do,
*    not WHAT it is
*  → Defines a CONTRACT that must be followed
*  → No shared logic, only method signatures
*  → One class can implement MULTIPLE interfaces
*
? Example idea:
*  Flyable → Bird, Airplane
*  Swimmable → Fish, Boat
*  (They are not related, but they share abilities)

? Mixin
*  → Use it when you want to REUSE behavior
*    without creating a parent-child relationship
*  → Used to add features to any class
*  → Cannot have constructors
*  → Uses `with` keyword
*
? Example idea:
*  Logger → add logging to Service, Controller, Repository
*  Cacheable → add caching to different classes

? Summary:
* Abstract class  → base class with shared behavior
* Interface       → contract (what class must do)
* Mixin           → reusable behavior
*/

/*
!--------------------------------------------------
! 4) ENUMS IN DART
!--------------------------------------------------
? Enums avoid magic numbers & hard-coded values
*/

//? Basic enum
enum UserRole { admin, user, guest }

//? Enhanced enum
//* Enhanced enums can have:
//*  - fields (variables)
//*  - constructors
//*  - methods

enum OrderStatus {
  // Each enum value calls the constructor and passes a readable label
  pending('Pending'),
  shipped('Shipped'),
  delivered('Delivered');

  // Enum constructor (must be const)
  // Used internally by enum values
  const OrderStatus(this.label);

  // Field that holds extra data for each enum value
  // final because enum values are constant
  final String label;
}

void testEnums() {
  print('\n--- Enums ---');

  //* Using a normal enum value
  // Enums are type-safe and avoid magic numbers/strings
  UserRole role = UserRole.admin;
  print(role); // Output: UserRole.admin

  //* Using enhanced enum
  // Accessing extra data attached to enum value
  OrderStatus status = OrderStatus.shipped;
  print(status.label); // Output: Shipped
}

/*
!--------------------------------------------------
! 5) ASYNC PROGRAMMING (INTRO)
!--------------------------------------------------
? Async code runs without blocking the main thread
*/

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data loaded';
}

void testAsync() async {
  print('\n--- Async Programming ---');

  //* Using await
  String result = await fetchData();
  print(result);

  //* Using .then()
  fetchData().then((value) {
    print(value);
  });
}

/*
!--------------------------------------------------
! 6) EXCEPTION HANDLING
!--------------------------------------------------
? Used to handle runtime errors safely
*/

class InvalidAmountException implements Exception {
  final String message;
  InvalidAmountException(this.message);
}

void withdraw(double amount) {
  if (amount <= 0) {
    throw InvalidAmountException('Amount must be greater than zero');
  }
  print('Withdraw successful');
}

void testExceptions() {
  print('\n--- Exception Handling ---');

  try {
    withdraw(-10);
  } catch (e) {
    print(
      'Error: ${e is InvalidAmountException ? (e).message : e.toString()}',
    ); // specific message for custom exception
  } finally {
    print('Operation finished'); // finally block always executes
  }
}
