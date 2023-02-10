import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:focal_agent_app/features/employees_list/data/models/employee_model.dart';
import '../../../../core/errors/failure.dart';

abstract class EmployeesListRemoteDataSourceAbstraction {
  Future<Either<Failure, List<EmployeeModel>>> fetchEmployeesList();
  Future<Either<Failure, String>> deleteEmployee();
}

class EmployeesListRemoteDataSource implements EmployeesListRemoteDataSourceAbstraction {
  @override
  Future<Either<Failure, List<EmployeeModel>>> fetchEmployeesList() async {
    final String mockedServerResponse = await rootBundle.loadString("assets/json/employees_list.json");
    final jsonData = jsonDecode(mockedServerResponse);
    final employeesList = EmployeeModel.decodeEmployeesList(jsonData['data']);
    await Future.delayed(const Duration(seconds: 2));
    return Right(employeesList);
  }

  @override
  Future<Either<Failure, String>> deleteEmployee() async {
    await Future.delayed(const Duration(seconds: 2));
    return const Right("Employee Deleted Successfully.");
  }
}
