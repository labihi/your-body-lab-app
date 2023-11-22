import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final double height;
  final double width;
  const Skeleton({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ));
  }
}
