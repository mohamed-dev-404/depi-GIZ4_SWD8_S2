void main() {
  //! ======================================================
  //! 1) COLLECTIONS (List – Set – Map)
  //! ======================================================

  //? -------------------- LIST ----------------------------
  List<int> numbers = [1, 2, 3, 4, 5];
  print("Initial List: $numbers");

  //* Access
  int firstNumber = numbers[0];
  print("First element: $firstNumber");

  //* List methods
  numbers.add(6);
  print("After add(6): $numbers");

  numbers.addAll([7, 8]);
  print("After addAll([7,8]): $numbers");

  numbers.remove(3);
  print("After remove(3): $numbers");

  numbers.removeAt(0);
  print("After removeAt(0): $numbers");

  numbers.removeWhere((e) => e > 6);
  print("After removeWhere(e > 6): $numbers");

  List<int> filtered = numbers.where((e) => e > 2).toList();
  print("Filtered list (e > 2): $filtered");

  bool hasFour = numbers.contains(4);
  print("Contains number 4? $hasFour");

  int? lastElement = numbers.lastOrNull;
  print("Last element or null: $lastElement");

  print("forEach elements:");
  numbers.forEach((e) {
    print(" - $e");
  });

  //? -------------------- SET -----------------------------
  Set<int> setA = {1, 2, 3};
  Set<int> setB = {3, 4, 5};

  print("\nSet A: $setA");
  print("Set B: $setB");

  //* Access
  int element = setA.elementAt(0);
  print("First element in setA: $element");

  //* Set operations
  Set<int> union = setA.union(setB);
  print("Union: $union");

  Set<int> intersection = setA.intersection(setB);
  print("Intersection: $intersection");

  Set<int> difference = setA.difference(setB);
  print("Difference (A - B): $difference");

  //* -------------------- MAP -----------------------------
  Map<String, int> scores = {"Ahmed": 90, "Omar": 80};
  print("\nInitial Map: $scores");

  //* Access
  int? ahmedScore = scores["Ahmed"];
  print("Ahmed score: $ahmedScore");

  //* Add / update
  scores["Sara"] = 95;
  print("After adding Sara: $scores");

  scores.addAll({"Laila": 88});
  print("After addAll: $scores");

  //* Map methods
  scores.remove("Omar"); //accept key
  print("After removing Omar: $scores");

  bool hasAhmed = scores.containsKey("Ahmed");
  print("Map contains Ahmed? $hasAhmed");

  print('map keys: ${scores.keys}');
  print('map values: ${scores.values}');

  //! ======================================================
  //! 2) RUNES (UNICODE)
  //! ======================================================
  String heart = "❤️";
  Runes runes = heart.runes;
  print("\nHeart runes: $runes");

  //! ======================================================
  //! 3) DateTime
  //! ======================================================
  DateTime now = DateTime.now();
  print("\nCurrent time: $now");

  DateTime custom = DateTime(2025, 1, 1);
  print("Custom date: $custom");

  //! ======================================================
  //! 4) CONST vs FINAL
  //! ======================================================
  final finalName; // can be initialized later not at declaration  and cannot be changed then
  finalName = "Mohamed";

  const pi = 3.14; // must be initialized at declaration and cannot be changed

  print("\nfinalName: $finalName");
  print("pi: $pi");

  //! ======================================================
  //! 5) VAR vs DYNAMIC
  //! ======================================================
  var fixedType =
      10; // var is a keyword that define type intelligently according to assigned value (in this example type becomes int)
  print("\nvar fixedType: $fixedType");

  dynamic flexible =
      10; // dynamic is datatype that can change and accept any type of value
  print("dynamic flexible (before change): $flexible");

  flexible = "hello"; // ok
  print("dynamic flexible (after change): $flexible");

  //! ======================================================
  //! 6) TRY & CATCH
  //! ======================================================
  try {
    int x = 10 ~/ 0;
    print(x);
  } catch (e) {
    print("\nError caught in try/catch: $e");
  }

  //! ======================================================
  //! 7) OPERATORS
  //! ======================================================
  int a = 10;
  print("\nInitial a = $a");

  a += 5;
  print("a += 5 → $a");

  a -= 3;
  print("a -= 3 → $a");

  a *= 2;
  print("a *= 2 → $a");

  a ~/= 4;
  print("a ~/= 4 → $a");

  dynamic b = 10;
  bool isInteger = b is int;
  print("a is int? $isInteger");

  bool isNotString = b is! String;
  print("a is! String? $isNotString");

  Object obj = "hello";
  String castedObj = obj as String;
  print("Cast obj as String → $castedObj");

  //! ======================================================
  //! 8) CONTROL FLOW (if – loops – switch)
  //! ======================================================

  //? -------------------- If statement -----------------------------
  print("\n--- If statement ---");
  int n = 10;

  if (n > 5) {
    print("$n is greater than 5");
  } else {
    print("$n is NOT greater than 5");
  }

  //? -------------------- For loop  -----------------------------
  print("\n--- For loop ---");

  for (int i = 0; i < 3; i++) {
    print("i = $i");
  }

  //? -------------------- While loop -----------------------------
  print("\n--- While loop ---");

  int counter = 0;
  while (counter < 3) {
    print("counter: $counter");
    counter++;
  }

  //? -------------------- Do While loop -----------------------------
  print("\n--- Do while loop ---");

  int x2 = 1;
  do {
    print("x2: $x2");
    x2++;
  } while (x2 < 3);

  //? -------------------- Switch  -----------------------------
  print("\n--- Switch ---");

  int day = 1;
  switch (day) {
    case 1:
      print("Today is Monday");
      break;
    case 2:
      print("Today is Tuesday");
      break;
    case 3:
      print("Today is Wednesday");
      break;
    default:
      print("Unknown day");
      break;
  }

  //! ======================================================
  //todo TASK 1: Sum list using forEach
  //! ======================================================
  List<int> myList = [1, 2, 3, 3, 4, 5];
  int sum = 0;
  myList.forEach((e) => sum += e);
  print("\n \nTask 1 – Sum of list: $sum");

  //! ======================================================
  //todo TASK 2: Largest of 3 numbers (use 3 methods)
  //! ======================================================
    int x = 7, y = 8, z = 9;


  //? METHOD 1: Using && (AND)
  if (x >= y && x >= z) {
    print("\nTask 2 – Method 1 – Largest is x = $x");
  } else if (y >= x && y >= z) {
    print("\nTask 2 – Method 1 – Largest is y = $y");
  } else {
    print("\nTask 2 – Method 1 – Largest is z = $z");
  }
  //* Comment: We check if each number is >= the others.


  //? METHOD 2: Using temp variable
  int max = x; //tentatively assume x is the largest

  if (y > max) max = y; // update if y is bigger
  if (z > max) max = z; // update if z is bigger

  print("Task 2 – Method 2 – Largest number: $max");
  //* Comment: We keep updating max with the bigger value.


  //? METHOD 3: Nested if
  if (x >= y) {
    // x is >= y
    if (x >= z) {
      print("Task 2 – Method 3 – Largest is $x");
    } else {
      print("Task 2 – Method 3 – Largest is $z");
    }
  } else {
    // y is > x
    if (y >= z) {
      print("Task 2 – Method 3 – Largest is $y");
    } else {
      print("Task 2 – Method 3 – Largest is $z");
    }
  }
  //* Comment: we Compare x & y first, then compare the winner with z and so on.


  //! ======================================================
  //todo TASK 3: Odd or even
  //! ======================================================
  int number = 24;

  if (number % 2 == 0) {
    print("\nTask 3 – $number is Even");
  } else {
    print("\nTask 3 – $number is Odd");
  }
}
