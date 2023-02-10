import 'package:focal_agent_app/dependencies/service_locator.dart';
import 'package:focal_agent_app/features/employees_list/data/datasources/employees_list_remote_data_source.dart';
import 'package:focal_agent_app/features/employees_list/data/repositories/employees_list_repo.dart';
import 'package:focal_agent_app/features/employees_list/domain/repositories/employees_list_repo_abstraction.dart';
import 'package:focal_agent_app/features/employees_list/domain/usecases/delete_employee_usecase.dart';
import 'package:focal_agent_app/features/employees_list/domain/usecases/fetch_employees_list_usecase.dart';
import 'package:focal_agent_app/features/employees_list/presentation/bloc/employees_list_bloc.dart';

class EmployeesListContainer implements ServiceLocator {
  EmployeesListContainer() {
    init();
  }

  @override
  void init() {
    serviceLocator.registerFactory(
        () => EmployeesListBloc(fetchEmployeesListUsecase: serviceLocator(), deleteEmployeesUsecase: serviceLocator()));

    serviceLocator.registerLazySingleton(() => FetchEmployeesListUsecase(repository: serviceLocator()));

    serviceLocator.registerLazySingleton(() => DeleteEmployeesUsecase(repository: serviceLocator()));

    serviceLocator.registerLazySingleton<EmployeesListRepositoryAbstraction>(
        () => EmployeesListRepository(remoteDataSource: serviceLocator()));

    serviceLocator
        .registerLazySingleton<EmployeesListRemoteDataSourceAbstraction>(() => EmployeesListRemoteDataSource());
  }
}
