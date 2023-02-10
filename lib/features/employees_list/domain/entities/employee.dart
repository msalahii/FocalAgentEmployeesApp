enum EmployeeCategory { iTDepartment, hr }

class Employee {
  final int employeeID;
  final String firstName;
  final String lastName;
  final EmployeeCategory category;

  Employee({required this.employeeID, required this.firstName, required this.lastName, required this.category});
}
