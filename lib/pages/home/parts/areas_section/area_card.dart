import 'package:flutter/material.dart';

Map<String, IconData> icons = {
  "fitness_center": Icons.fitness_center,
  "spa": Icons.spa,
  "crib": Icons.crib,
  "medical_services": Icons.medical_services,
  "psychology": Icons.psychology,
  "egg_alt": Icons.egg_alt,
};

class AreaCard extends StatelessWidget {
  final String title;
  final String icon;
  final int color;
  const AreaCard(
      {super.key,
      required this.title,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).textScaler.scale(20) * 10,
      width: 150,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icons[icon], size: 50, color: Colors.white),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
