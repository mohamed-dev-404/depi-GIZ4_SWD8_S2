void main() {
  // ---------------------------------------------------------
  //! 1) PRINTING & STRING INTERPOLATION
  // ---------------------------------------------------------
  String fullName = 'Mohamed Ibrahim';
  String jobTitle = 'Flutter Developer';

  print('Hello DEPI!');
  print('I am ${fullName.toUpperCase()}');
  print('My job title is $jobTitle\n');

  // ---------------------------------------------------------
  //! 2) NUMBERS (int, double, num)
  // ---------------------------------------------------------
  num num1 = 9.4;    // num can hold int or double
  num num2 = 10;     // still valid because it's an integer
  double d1 = 9.8;   // for fractional values only
  int i1 = 5;        // integer only

  print('num1 = $num1 | num2 = $num2 | d1 = $d1 | i1 = $i1\n');

  // ---------------------------------------------------------
  //! 3) ROUNDING METHODS
  // ---------------------------------------------------------
  print('round(): ${num1.round()}');   // closest int
  print('floor(): ${num1.floor()}');   // down
  print('ceil():  ${num1.ceil()}\n');  // up

  // ---------------------------------------------------------
  //! 4) toStringAsFixed()
  // ---------------------------------------------------------
  double backendVal = 120.98491861881;
  String fixedVal = backendVal.toStringAsFixed(3);

  print('Value from backend: $backendVal');
  print('Displayed (3 decimals): $fixedVal\n'); //after fix

  // ---------------------------------------------------------
  //! 5) PARSING
  // ---------------------------------------------------------
  String intStr = '50';
  String doubleStr = '99.75';

  int parsedInt = int.parse(intStr);
  double parsedDouble = double.parse(doubleStr);
  int? safeParse = int.tryParse('abc');   // returns null (safe)

  print('Parsed int: $parsedInt');
  print('Parsed double: $parsedDouble');
  print('TryParse result: $safeParse\n');

  // ---------------------------------------------------------
  //! 6) STRING METHODS
  // ---------------------------------------------------------
  String s = "  Hello Flutter  ";

  print('Length: ${s.length}');
  print('Lowercase: ${s.toLowerCase()}');
  print('Uppercase: ${s.toUpperCase()}');
  print('Trimmed: "${s.trim()}"');
  print('Contains "Flutter"? ${s.contains("Flutter")}');
  print('Starts with "H"? ${s.trim().startsWith("H")}');
  print('Ends with "er"? ${s.trim().endsWith("er")}');
  print('Replace example: ${s.replaceAll("Flutter", "Dart")}');
  print('Substring (2 → 7): ${s.substring(2, 7)}\n');

  // -------------------------------------------------------------------------------
  //? 7) TASK: Capitalize the first letter of a name using toUpperCase & substring
  // --------------------------------------------------------------------------------
  String name = 'ahmed';

  String firstChar = name[0].toUpperCase();
  String restString = name.substring(1);
  String capitalizedName = firstChar + restString;

  print('Capitalized name: $capitalizedName');
}
