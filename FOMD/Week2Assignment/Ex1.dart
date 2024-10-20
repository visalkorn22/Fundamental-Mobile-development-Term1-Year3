enum Skill { FLUTTER, DART, OTHER }

class Address {
  String _street;
  String _city;
  String _zipCode;

  Address(this._street, this._city, this._zipCode);

  get street => _street;
  get city => _city;
  get zipCode => _zipCode;

  @override
  String toString() {
    return '(Street: $_street, City: $_city, Zip Code: $_zipCode)';
  }
}

class Employee {
  String _name;
  final double _baseSalary; // dynamic salary with different bonuses
  int _yearOfExperience;
  String _typeOfEmployee;
  Skill _primarySkill;
  List<Skill> skills = []; // an employee can have multiple skills
  Address _address;

  Employee(this._name, this._baseSalary, this._yearOfExperience,
      this._primarySkill, this._address, this._typeOfEmployee) {
    skills.add(_primarySkill); // add primary skill initially
  }

  // Named constructors for Mobile and Web developers
  Employee.mobileDeveloper(
      String name, double baseSalary, int yearOfExperience, Address address)
      : this(name, baseSalary, yearOfExperience, Skill.FLUTTER, address,
            'Mobile Developer');

  Employee.webDeveloper(
      String name, double baseSalary, int yearOfExperience, Address address)
      : this(name, baseSalary, yearOfExperience, Skill.OTHER, address,
            'Web Developer');

  // Add more skills to an employee
  void addSkill(Skill newSkill) {
    if (!skills.contains(newSkill)) {
      this.skills.add(newSkill);
    }
  }

  // Getters
  get name => _name;
  get baseSalary => _baseSalary;
  get yearOfExperience => _yearOfExperience;
  get address => _address;
  get typeOfEmployee => _typeOfEmployee;

  // Compute total salary based on years of experience and skills
  double computeTotalSalary() {
    double totalSalary = _baseSalary;

    // Bonus for experience
    totalSalary += (_yearOfExperience * 200);

    // Add salary bonuses based on skills
    for (Skill skill in skills) {
      switch (skill) {
        case Skill.DART:
          totalSalary += 300;
          break;
        case Skill.FLUTTER:
          totalSalary += 500;
          break;
        case Skill.OTHER:
          totalSalary += 100;
          break;
        default:
          totalSalary += 50;
      }
    }

    return totalSalary;
  }

  // Print employee details
  void printDetails() {
    String skillList =
        skills.map((skill) => skill.toString().split('.').last).join(', ');
    print(
        'Employee: $_name,\nBase Salary: \$$_baseSalary,\nYears of Experience: $_yearOfExperience year(s),\nSkills: $skillList,\nAddress: $_address,\nType of Employee: $_typeOfEmployee,\nTotal Salary: \$${computeTotalSalary()}\n');
  }
}

void main() {
  // Create Address
  Address address = Address("st123", "pp", "123456");

  // Create employees
  Employee employee =
      Employee("Ka", 400, 1, Skill.FLUTTER, address, "Web Developer");
  Employee emp1 = Employee.mobileDeveloper(
      'Sokea', 5000, 2, Address("st147", "KPS", "855"));
  Employee emp2 = Employee.webDeveloper('Sok', 40000, 5, address);

  // Print employee details
  employee.printDetails();
  emp1.printDetails();
  emp2.printDetails();

  // Add a new skill to employee and print details again
  employee.addSkill(Skill.DART);
  employee.printDetails();
}
