import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EmployeeShimmerCardWidget extends StatelessWidget {
  const EmployeeShimmerCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: ListTile(
        leading: Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade300,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
            )),
        title: Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade300,
            child: Container(
              width: 40,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
            )),
        subtitle: Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade300,
            child: Container(
              width: 40,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
            )),
      ),
    );
  }
}
