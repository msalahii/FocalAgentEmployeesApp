import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focal_agent_app/dependencies/service_locator.dart';
import 'package:focal_agent_app/features/employees_list/presentation/bloc/employees_list_bloc.dart';
import 'package:focal_agent_app/features/employees_list/presentation/widgets/employee_card_widget.dart';
import 'package:focal_agent_app/features/employees_list/presentation/widgets/employee_shimmer_card_widget.dart';

class EmployeesListView extends StatelessWidget {
  const EmployeesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmployeesListBloc>(
      create: (_) => serviceLocator()..add(FetchEmployeesListEvent()),
      child: BlocConsumer<EmployeesListBloc, EmployeesListState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text("Employees List"),
                  actions: [
                    TextButton(
                        onPressed: () => context.read<EmployeesListBloc>().add(FetchEmployeesListEvent()),
                        child: const Text(
                          "Reset",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                  bottom: TabBar(
                      onTap: (index) {
                        switch (index) {
                          case 0:
                            context.read<EmployeesListBloc>().add(const ChangeEmployeeReportTypeEvent(
                                selectedReportType: EmployeeReportType.allEmployees));
                            break;
                          case 1:
                            context.read<EmployeesListBloc>().add(const ChangeEmployeeReportTypeEvent(
                                selectedReportType: EmployeeReportType.itEmployees));
                            break;
                          case 2:
                            context.read<EmployeesListBloc>().add(const ChangeEmployeeReportTypeEvent(
                                selectedReportType: EmployeeReportType.hrEmployees));
                            break;
                        }
                      },
                      tabs: const [
                        Tab(
                          text: "All",
                        ),
                        Tab(
                          text: "IT",
                        ),
                        Tab(
                          text: "HR",
                        )
                      ]),
                ),
                body: ListView.builder(
                    itemCount: state is FetchEmployeesListLoadingState
                        ? 10
                        : context.watch<EmployeesListBloc>().employeesList.length,
                    itemBuilder: (context, index) {
                      late Widget listItem;
                      if (state is FetchEmployeesListLoadingState) {
                        listItem = const EmployeeShimmerCardWidget();
                      } else {
                        listItem = Padding(
                          padding: const EdgeInsets.only(top: 16, left: 8, right: 8.0),
                          child: EmployeeCardWidget(
                              onDelete: () {
                                context.read<EmployeesListBloc>().add(DeleteEmployeeEvent(
                                    employee: context.read<EmployeesListBloc>().employeesList[index]));
                              },
                              employee: context.watch<EmployeesListBloc>().employeesList[index]),
                        );
                      }
                      return listItem;
                    })),
          );
        },
        listener: (context, state) {
          if (state is FetchEmployeesListFailedState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed")));
          } else if (state is DeleteEmployeeLoadingState) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)), color: Colors.white),
                        height: 100,
                        width: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Center(
                              child: SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text("Deleting Employee..")
                          ],
                        ),
                      ),
                    ));
          } else if (state is DeleteEmployeeSuccessState) {
            Navigator.pop(context);
            final snackBar = SnackBar(content: Text(state.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      ),
    );
  }
}
