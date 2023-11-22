import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AreasHeader extends StatelessWidget {
  const AreasHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Le nostre aree",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        IconButton(
          onPressed: () => context.go('/areas'),
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
