import 'package:focal_agent_app/features/employees_list/domain/entities/employee.dart';

class EmployeeModel extends Employee {
  EmployeeModel(
      {required super.employeeID, required super.firstName, required super.lastName, required super.category});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    late EmployeeCategory category;
    switch (json['category']) {
      case "IT":
        category = EmployeeCategory.iTDepartment;
        break;
      case "HR":
        category = EmployeeCategory.hr;
        break;
    }
    return EmployeeModel(
        employeeID: json['employeeID'], firstName: json['firstName'], lastName: json['lastName'], category: category);
  }

  static List<EmployeeModel> decodeEmployeesList(List<dynamic> json) =>
      json.map<EmployeeModel>((employee) => EmployeeModel.fromJson(employee)).toList();
}
