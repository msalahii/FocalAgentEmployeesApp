import 'package:flutter/material.dart';
import 'package:focal_agent_app/features/employees_list/data/models/employee_model.dart';
import 'package:focal_agent_app/features/employees_list/domain/entities/employee.dart';

class EmployeeCardWidget extends StatelessWidget {
  final EmployeeModel employee;
  final VoidCallback onDelete;
  const EmployeeCardWidget({super.key, required this.employee, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.all(Radius.circular(8)), boxShadow: [
        BoxShadow(
          color: const Color(0xff575B7D).withOpacity(0.075),
          offset: const Offset(0, 4),
          blurRadius: 40,
        )
      ]),
      child: ListTile(
        leading: Image.asset(
          employee.category == EmployeeCategory.iTDepartment ? "assets/images/it.png" : "assets/images/hr.png",
          width: 40,
        ),
        title: Text("${employee.firstName} ${employee.lastName}"),
        subtitle: Text("#ID: ${employee.employeeID}"),
        trailing: TextButton(
            onPressed: onDelete,
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            )),
      ),
    );
  }
}
