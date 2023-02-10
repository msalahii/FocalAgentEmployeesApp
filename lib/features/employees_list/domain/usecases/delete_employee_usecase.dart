import 'package:focal_agent_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:focal_agent_app/core/usecase/usecase.dart';
import 'package:focal_agent_app/features/employees_list/domain/repositories/employees_list_repo_abstraction.dart';

class DeleteEmployeesUsecase extends Usecase<String, NoParams> {
  final EmployeesListRepositoryAbstraction repository;

  DeleteEmployeesUsecase({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.deleteEmployee();
  }
}
