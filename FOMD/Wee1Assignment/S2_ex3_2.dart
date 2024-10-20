class Person {
  final String name;
  final int age;

  // Constructor to initialize final variables
  Person(this.name, this.age);
}

void main() {
  // Create a final object of the Person class
  final Person person = Person("Visal", 20);

  // The person object cannot be reassigned, but its properties can be read
  print("Name: ${person.name}");
  print("Age: ${person.age}");
  
 
}
