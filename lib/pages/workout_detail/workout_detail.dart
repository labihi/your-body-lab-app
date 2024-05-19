import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:your_body_lab/components/bottom_sheet_exercise.dart';
import 'package:your_body_lab/components/error_message.dart';
import 'package:your_body_lab/components/exercise_card.dart';
import 'package:your_body_lab/models/workout_plan.model.dart';
import 'package:your_body_lab/services/workout_service.dart';

class WorkoutDetail extends StatefulWidget {
  final String title;
  final String id;

  const WorkoutDetail({super.key, required this.title, required this.id});

  @override
  State<WorkoutDetail> createState() => _WorkoutDetailState();
}

class _WorkoutDetailState extends State<WorkoutDetail> {
  late Future<WorkoutPlan> workout;

  @override
  void initState() {
    super.initState();
    workout = getWorkout(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: workout,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              inspect(snapshot.data!);
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5 / 3.5,
                ),
                itemCount: snapshot.data!.exercises.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onLongPress: () => log("Long Press"),
                      onTap: () => Scaffold.of(context).showBottomSheet(
                          (context) =>
                              BottomSheetExercise(snapshot.data!, index)),
                      child: ExerciseCard(snapshot.data!, index));
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: ErrorMessage(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
