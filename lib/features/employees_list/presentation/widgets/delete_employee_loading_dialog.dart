import 'package:flutter/material.dart';

class DeleteEmployeeLoadingDialog extends StatelessWidget {
  const DeleteEmployeeLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), color: Colors.white),
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
    );
  }
}
