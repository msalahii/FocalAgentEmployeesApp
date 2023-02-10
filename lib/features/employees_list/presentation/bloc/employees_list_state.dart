part of 'employees_list_bloc.dart';

abstract class EmployeesListState extends Equatable {
  const EmployeesListState();

  @override
  List<Object> get props => [];
}

class EmployeesListInitial extends EmployeesListState {}

class FetchEmployeesListLoadingState extends EmployeesListState {}

class FetchEmployeesListSuccessState extends EmployeesListState {
  final List<EmployeeModel> employeesList;

  const FetchEmployeesListSuccessState({required this.employeesList});
}

class FetchEmployeesListFailedState extends EmployeesListState {
  final String failureMessage;

  const FetchEmployeesListFailedState({required this.failureMessage});
}

class ChangeReportTypeLoadingState extends EmployeesListState {}

class ChangeReportTypeSuccessState extends EmployeesListState {}

class DeleteEmployeeLoadingState extends EmployeesListState {}

class DeleteEmployeeSuccessState extends EmployeesListState {
  final String message;

  const DeleteEmployeeSuccessState({required this.message});
}

class DeleteEmployeeFailedState extends EmployeesListState {
  final String failureMessage;

  const DeleteEmployeeFailedState({required this.failureMessage});
}
