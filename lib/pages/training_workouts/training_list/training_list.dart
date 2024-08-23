import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';
import 'package:your_body_lab/models/workout_plan.model.dart';
import 'package:your_body_lab/pages/training_workouts/training_list/parts/training_card.dart';
import 'package:your_body_lab/services/go_router_utils.dart';
import 'package:your_body_lab/services/workout_service.dart';

Map<String, String> test = {
  "beginner": "Principiante",
  "intermediate": "Intermedio",
  "advanced": "Avanzato",
};

class TrainingList extends StatefulWidget {
  final String difficulty;

  const TrainingList({super.key, required this.difficulty});

  @override
  State<TrainingList> createState() => _TrainingListState();
}

class _TrainingListState extends State<TrainingList> {
  late Future<PaginatedResponse<WorkoutPlan>>? workouts;

  @override
  void initState() {
    super.initState();
    workouts = getWorkoutsFromDifficulty(widget.difficulty);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schede ${test[widget.difficulty]}"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: FutureBuilder(
          future: workouts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.docs.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => context.go(
                      "${getCurrentRoute(context)}/${snapshot.data!.docs[index].id}",
                      extra: snapshot.data!.docs[index].title,
                    ),
                    child: TrainingCard(
                      title: snapshot.data!.docs[index].title,
                      image: snapshot.data!.docs[index].image.url!,
                      duration: snapshot.data!.docs[index].totalDuration,
                      daysPerWeek:
                          "${snapshot.data!.docs[index].daysPerWeek} Giorni",
                      goals: snapshot.data!.docs[index].tags!,
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
