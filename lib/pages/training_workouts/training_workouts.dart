import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab/components/area_item_card.dart';

class TrainingWorkouts extends StatelessWidget {
  const TrainingWorkouts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Schede allenamento"),
        ),
        body: const Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AreaItemCard('principiante',
                    title: 'Principiante',
                    imagePath: "assets/images/training_1.jpg",
                    destinationPath:
                        '/areas/Allenamento/schede/trainings/beginner'),
                AreaItemCard('intermedio',
                    title: 'Intermedio',
                    imagePath: "assets/images/training_2.jpg",
                    destinationPath:
                        '/areas/Allenamento/schede/trainings/intermediate'),
                AreaItemCard('avanzato',
                    title: 'Avanzato',
                    imagePath: "assets/images/training_3.jpg",
                    destinationPath:
                        '/areas/Allenamento/schede/trainings/advanced'),
              ],
            ),
          ),
        ));
  }
}
