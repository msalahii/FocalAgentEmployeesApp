import 'package:focal_agent_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:focal_agent_app/core/usecase/usecase.dart';
import 'package:focal_agent_app/features/employees_list/domain/repositories/employees_list_repo_abstraction.dart';

import '../../data/models/employee_model.dart';

class FetchEmployeesListUsecase extends Usecase<List<EmployeeModel>, NoParams> {
  final EmployeesListRepositoryAbstraction repository;

  FetchEmployeesListUsecase({required this.repository});

  @override
  Future<Either<Failure, List<EmployeeModel>>> call(NoParams params) async {
    return await repository.fetchEmployeesList();
  }
}
