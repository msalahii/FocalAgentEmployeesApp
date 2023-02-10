import 'package:flutter/material.dart';
import 'package:focal_agent_app/features/employees_list/presentation/pages/employees_list_view.dart';
import 'dependencies/app_container.dart' as dependancy_injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependancy_injection.init();
  runApp(const FocalAgentApp());
}

class FocalAgentApp extends StatelessWidget {
  const FocalAgentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focal Agent App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const EmployeesListView(),
    );
  }
}
