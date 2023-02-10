part of 'employees_list_bloc.dart';

abstract class EmployeesListEvent extends Equatable {
  const EmployeesListEvent();

  @override
  List<Object> get props => [];
}

class FetchEmployeesListEvent extends EmployeesListEvent {}

class ChangeEmployeeReportTypeEvent extends EmployeesListEvent {
  final EmployeeReportType selectedReportType;

  const ChangeEmployeeReportTypeEvent({required this.selectedReportType});
}

class DeleteEmployeeEvent extends EmployeesListEvent {
  final EmployeeModel employee;

  const DeleteEmployeeEvent({required this.employee});
}
