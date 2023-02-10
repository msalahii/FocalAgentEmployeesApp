import 'package:focal_agent_app/features/employees_list/data/datasources/employees_list_remote_data_source.dart';
import 'package:focal_agent_app/features/employees_list/data/models/employee_model.dart';
import 'package:focal_agent_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:focal_agent_app/features/employees_list/domain/repositories/employees_list_repo_abstraction.dart';

class EmployeesListRepository implements EmployeesListRepositoryAbstraction {
  final EmployeesListRemoteDataSourceAbstraction remoteDataSource;

  EmployeesListRepository({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<EmployeeModel>>> fetchEmployeesList() async {
    return await remoteDataSource.fetchEmployeesList();
  }

  @override
  Future<Either<Failure, String>> deleteEmployee() async {
    return await remoteDataSource.deleteEmployee();
  }
}
