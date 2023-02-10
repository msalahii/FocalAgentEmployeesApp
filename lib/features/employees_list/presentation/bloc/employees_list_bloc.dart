import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:focal_agent_app/core/usecase/usecase.dart';
import 'package:focal_agent_app/features/employees_list/data/models/employee_model.dart';
import 'package:focal_agent_app/features/employees_list/domain/entities/employee.dart';
import 'package:focal_agent_app/features/employees_list/domain/usecases/delete_employee_usecase.dart';
import 'package:focal_agent_app/features/employees_list/domain/usecases/fetch_employees_list_usecase.dart';
part 'employees_list_event.dart';
part 'employees_list_state.dart';

enum EmployeeReportType { allEmployees, itEmployees, hrEmployees }

class EmployeesListBloc extends Bloc<EmployeesListEvent, EmployeesListState> {
  final FetchEmployeesListUsecase _fetchEmployeesListUsecase;
  final DeleteEmployeesUsecase _deleteEmployeesUsecase;
  List<EmployeeModel> _fullEmployeesList = [];
  List<EmployeeModel> _filteredEmployeesList = [];
  List<EmployeeModel> _itEmployeesList = [];
  List<EmployeeModel> _hrEmployeesList = [];

  EmployeeReportType _selectedEmployeeReportType = EmployeeReportType.allEmployees;
  EmployeeReportType get selectedEmployeeReportType => _selectedEmployeeReportType;
  List<EmployeeModel> get employeesList => _filteredEmployeesList;

  EmployeesListBloc(
      {required FetchEmployeesListUsecase fetchEmployeesListUsecase,
      required DeleteEmployeesUsecase deleteEmployeesUsecase})
      : _fetchEmployeesListUsecase = fetchEmployeesListUsecase,
        _deleteEmployeesUsecase = deleteEmployeesUsecase,
        super(EmployeesListInitial()) {
    on<FetchEmployeesListEvent>((event, emit) async {
      emit(FetchEmployeesListLoadingState());
      final result = await _fetchEmployeesListUsecase(NoParams());
      result.fold((failure) => emit(FetchEmployeesListFailedState(failureMessage: failure.message)), (success) {
        _fullEmployeesList = success;
        _hrEmployeesList = _fullEmployeesList.where((employee) => employee.category == EmployeeCategory.hr).toList();
        _itEmployeesList =
            _fullEmployeesList.where((employee) => employee.category == EmployeeCategory.iTDepartment).toList();
        _filteredListDataBinding();
        emit(FetchEmployeesListSuccessState(employeesList: success));
      });
    });

    on<ChangeEmployeeReportTypeEvent>((event, emit) {
      emit(ChangeReportTypeLoadingState());
      _selectedEmployeeReportType = event.selectedReportType;
      _filteredListDataBinding();
      emit(ChangeReportTypeSuccessState());
    });

    on<DeleteEmployeeEvent>(((event, emit) async {
      emit(DeleteEmployeeLoadingState());
      final result = await _deleteEmployeesUsecase(NoParams());
      result.fold((failure) => emit(DeleteEmployeeFailedState(failureMessage: failure.message)), (success) {
        _fullEmployeesList.remove(event.employee);
        if (event.employee.category == EmployeeCategory.hr) {
          _hrEmployeesList.remove(event.employee);
        } else if (event.employee.category == EmployeeCategory.iTDepartment) {
          _itEmployeesList.remove(event.employee);
        }
        emit(DeleteEmployeeSuccessState(message: success));
      });
    }));
  }

  _filteredListDataBinding() {
    switch (selectedEmployeeReportType) {
      case EmployeeReportType.hrEmployees:
        _filteredEmployeesList = _hrEmployeesList;
        break;
      case EmployeeReportType.itEmployees:
        _filteredEmployeesList = _itEmployeesList;
        break;

      case EmployeeReportType.allEmployees:
        _filteredEmployeesList = _fullEmployeesList;
        break;
    }
  }
}
