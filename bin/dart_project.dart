import 'dart:io';

String result(String grade) {
  switch (grade) {
    case 'A':
      return "Excellent";
    case 'B':
      return "Good";
    case 'C':
      return "Fair";
    case 'D':
      return "Needs Improvement";
    default:
      return "Invalid Grade";
  }
}

int calculateArea(int length, int width) {
  int area = length * width;
  return area;
}

int calculatePerimeter(int length, int width) {
  int perimeter = 2 * (length + width);
  return perimeter;
}

String? printName(String? name) {
  if (name == null || name.isEmpty) {
    return "Name is not provided";
  } else {
    return "Name is: $name";
  }
}

int? divideNumbers(int a, int b) {
  try {
    return a ~/ b;
  } catch (e) {
    print("Error: Cannot divide by zero.");
    return null;
  }
}

double? calculate(double num1, double num2, String operator) {
  try {
    switch (operator) {
      case '+':
        return num1 + num2;
        // break is not needed as each case returns the value
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        if (num2 == 0) {
          print("Error: Division by zero is not allowed.");
          return null;
        }
        return num1 / num2;
      case '%':
        if (num2 == 0) {
          print("Error: Modulo by zero is not allowed.");
          return null;
        }
        return num1 % num2;
      case '~/':
        if (num2 == 0) {
          print("Error: Integer division by zero is not allowed.");
          return null;
        }
        return (num1 ~/ num2)
            .toDouble(); // toDouble() - as the return type is int
      default:
        print("Error: Unsupported operator.");
        return null;
    }
  } catch (e) {
    print("Error: An exception occurred: $e");
    return null;
  }
}

void mainTasks() {
  print("\nEnter 1 for Area Calculation\n"
      "Enter 2 for Perimeter Calculation\n"
      "Enter 3 for Printing Name\n"
      "Enter 4 for Divide Numbers\n"
      "Enter 5 for Calculations\n"
      "Enter 0 to Exit");

  stdout.write("\nEnter Choice: ");
  String? choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      int area = calculateArea(5, 3);
      print("\nArea is: $area");
      break;
    case '2':
      int perimeter = calculatePerimeter(5, 3);
      print("\nPerimeter is: $perimeter");
      break;
    case '3':
      stdout.write("\nEnter Your Name: ");
      String? name = stdin.readLineSync();
      String? nameResult = printName(name); // to store the return string if no input is given
      print(nameResult);
      break;

    case '4':
      stdout.write("\nEnter Dividend: ");
      int a = int.parse(stdin.readLineSync()!);

      stdout.write("Enter Divisor: ");
      int b = int.parse(stdin.readLineSync()!);

      int? result = divideNumbers(a, b);
      if (result != null) {
        print("\nResult of division: $result");
      }
      break;
    case '5':
      stdout.write("\nEnter First Number: ");
      double num1 = double.parse(stdin.readLineSync()!);

      stdout.write("Enter Second Number: ");
      double num2 = double.parse(stdin.readLineSync()!);

      stdout.write("Enter Operator (+, -, *, /, %, ~/): ");
      String operator = stdin.readLineSync()!;

      double? calcResult = calculate(num1, num2, operator);
      if (calcResult != null) {
        print("\nCalculation Result: $calcResult");
      }
      break;
    case '0':
      print("\nExiting...");
      return;
    default:
      print("Invalid choice. Please try again.");
  }
}

void main() {
  stdout.write("\n\t\t\t\t\t\t\t\t\t\t\t\t\t ********************************");
  print("\n\t\t\t\t\t\t\t\t\t\t\t\t\t **   A Basic Project in Dart  **");
  print("\t\t\t\t\t\t\t\t\t\t\t\t\t ********************************");

  mainTasks();
  while(true){
    stdout.write("\nDo you want perform more tasks? then Enter 1 or Enter 0 for Exit: ");
    String? choice = stdin.readLineSync();
    switch(choice){
      case '1':
        mainTasks();
        break;
      case '0': return;
      default: print("Enter a Valid Choice");
    }
  }
}
