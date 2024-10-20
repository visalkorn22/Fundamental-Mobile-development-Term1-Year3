void greet(String name, int age) {
  print("Hello, my name is $name and I am $age years old.");
}

void introduce({required String name, required int age}) {
  print("Hello, my name is $name and I am $age years old.");
}

int square(int number) => number * number;

void main() {
  // Calling functions with positional arguments
  greet("Visal", 20);

  // Calling functions with named arguments
  introduce(name: "Sengly", age:19);

  // Calling a function with arrow syntax
  int result = square(4);
  print("The square of 4 is $result.");
}
