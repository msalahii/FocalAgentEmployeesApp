import 'package:dartz/dartz.dart';
import 'package:focal_agent_app/features/employees_list/data/models/employee_model.dart';

import '../../../../core/errors/failure.dart';

abstract class EmployeesListRepositoryAbstraction {
  Future<Either<Failure, List<EmployeeModel>>> fetchEmployeesList();
  Future<Either<Failure, String>> deleteEmployee();
}
