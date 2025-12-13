import 'dart:io';

/*
!=====================================================
!Session 3 – Dart Basics (Flutter Internship)
!=====================================================

? Topics covered in this file:
!1) Null Safety in Dart
!2) Taking input from the user & Type parsing and null handling 
!3) Loops (for / while / do-while) & break & continue 
!4) Functions in Dart
!   - return types
!   - parameter types
!5) OOP introduction
!   - Classes & Objects
!   - Constructors
!   - Methods
?=====================================================
*/

void main() {
  print('========= SESSION 3 =========\n');

  testNullSafety();
  testUserInputAndParsing();
  testLoops();
  testFunctions();
  testHumanClass();
  testEmployee();

  print('\n========= END OF SESSION =========');
}

/*
!--------------------------------------------------
! 1) NULL SAFETY IN DART
!--------------------------------------------------
 */

void testNullSafety() {
  print('\n--- Null Safety ---');

  //*   ?    => variable can be null
  //*   !    => trust me, this value is NOT null (use it carefully)
  //*   ??   => if null, use another value
  //*   ??=  => assign only if null
  //*   late => initialize later (before use)

  double? rate; // nullable variable
  rate ??= 3.5; // assign 3.5 only if rate is null
  print('Rate value: $rate');

  String? name;
  String displayName = name ?? 'Guest'; // fallback value if name is null
  print('Welcome $displayName');
}

/*
!--------------------------------------------------
! 2) USER INPUT & TYPE PARSING
!--------------------------------------------------
 */

void testUserInputAndParsing() {
  print('\n--- User Input & Parsing ---');

  print('Enter your name:');
  String? name = stdin
      .readLineSync(); // readLineSync() returns String? and name is String?
  print('Name: $name'); // name can be null

  /*
 *   stdin.readLineSync() => returns String? (nullable String)
 *   int.tryParse() => returns int?
 *   ?? => is used to protect from null values
  */

  //? Example: Read two numbers and print their sum (with null safety)
  print('Enter first number:');
  int x = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  print('Enter second number:');
  int y = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  print('Sum = ${x + y}');
}

/* 
!--------------------------------------------------
! 3) LOOPS IN DART
!-------------------------------------------------- */

void testLoops() {
  print('\n--- Loops ---');

  //todo Example: calculate factorial using for loop
  int number = 5;
  int factorial = 1;

  for (int i = 1; i <= number; i++) {
    factorial *= i;
  }

  print('Factorial of $number = $factorial');

  //? break & continue example:
  for (int i = 1; i <= 10; i++) {
    if (i == 5) continue; // skip 5
    if (i == 9) break; // stop loop at 9
    print(i);
  }
}

/*
! --------------------------------------------------
! 4) FUNCTIONS IN DART
!-------------------------------------------------- */

void testFunctions() {
  print('\n--- Functions ---');

  print('Add(dynamic): ${add(2, 3)}');
  print('Add(int): ${sum(5, 2)}');
  print('Subtract: ${subtract(10, 4)}');
  print('Multiply: ${multiply(3, 4)}');
  print('Divide: ${divide(10, 2)}');

  greetUser();
  greetUser('Mohamed');

  mixParameters(45465, title: 'Flutter Developer');
}

/*
? NOTE THAT:
* When parameter type and return type is not specified,
* Dart considers it dynamic
*/
add(a, b) {
  return a +
      b; // add function with dynamic return type, a & b are dynamic parameters
}

//! Typed functions:
//? mean The return type is explicitly specified & The parameter types are explicitly specified
//? its consider Best Practice
int sum(int a, int b) => a + b;
int subtract(int a, int b) => a - b;
int multiply(int a, int b) => a * b;
double divide(int a, int b) => a / b;

/*
?=====================================================
! Types of Parameters in Dart – With Examples
?=====================================================
*/

/*
? --------------------------------------------------
? 1) Required Positional Parameters
* - Must be passed
* - Order matters
?-------------------------------------------------- */
int addTwoNumbers(int a, int b) {
  return a + b;
}

//* Usage:
// add(3, 5);        ✅ Correct
// add(3);           ❌ Error (missing parameter)
// add(b: 5, a: 3);  ❌ Error (not named)

/* 
?--------------------------------------------------
?2) Optional Positional Parameters []
* - Can be omitted (optional)
* - Order matters
* - Have default values OR nullable
?-------------------------------------------------- */
void greetUser([String name = 'Guest']) {
  print('Hello $name');
}

//* Usage:
// greet();          → Hello Guest
// greet('Ahmed');   → Hello Ahmed

/*
? --------------------------------------------------
?3) Optional Named Parameters {}
* - Passed by name
* - Can be omitted (optional)
* - Order does NOT matter
?-------------------------------------------------- */

void printInfo({String? name, int? age}) {
  print('Name: $name, Age: $age');
}

//* Usage:
// printInfo(name: 'Ali');
// printInfo(age: 20);
// printInfo(name: 'Ali', age: 20);

/*
? --------------------------------------------------
? 4) Required Named Parameters {required}
* - Must be passed
* - Passed by name
* - Order does NOT matter
* - Clear and readable (Best Practice)
?-------------------------------------------------- */

void createUser({required String name, required int age}) {
  print('User: $name, Age: $age');
}

//* Usage:
// createUser(name: 'Mohamed', age: 22);  ✅
// createUser(name: 'Mohamed');           ❌ Error

/*
? --------------------------------------------------
? Mixing Positional + Named Parameters
* - Positional MUST come first
?-------------------------------------------------- */

void mixParameters(int id, {required String title, int count = 0}) {
  print('ID: $id, Title: $title, Count: $count');
}

//* Usage:
// mixExample(1, title: 'Flutter');
// mixExample(1, title: 'Flutter', count: 5);

/*
! --------------------------------------------------
! 5) OOP INTRODUCTION (CLASSES & OBJECTS)
!-------------------------------------------------- */

class Human {
  //* Attributes (fields)
  String name;
  int age;
  double height;
  double weight;

  //* Constructor
  Human({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
  });

  //* Methods (behavior)
  void eat() {
    print('$name is eating');
  }

  void sleep() {
    print('$name is sleeping');
  }

  void introduce() {
    print(
      'Hello, my name is $name. I am $age years old, '
      '$height cm tall and weigh $weight kg.',
    );
  }
}

void testHumanClass() {
  print('\n--- Human Class ---');

  Human human = Human(name: 'Ahmed', age: 22, height: 175, weight: 70);

  human.introduce();
  human.eat();
  human.sleep();
}

/* --------------------------------------------------
todo TASK: EMPLOYEE CLASS
-------------------------------------------------- */

class Employee {
  String name;
  int years;
  double salary;

  Employee({required this.name, required this.years, required this.salary});

  void display() {
    print(
      'My name is $name, I have worked for $years years '
      'and my salary is $salary EGP.',
    );
  }
}

void testEmployee() {
  print('\n--- Employee Class ---');

  Employee emp = Employee(name: 'Mohamed', years: 5, salary: 15000);

  emp.display();
}

