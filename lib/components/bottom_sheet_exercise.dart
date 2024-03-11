import 'package:flutter/material.dart';
import 'package:your_body_lab/components/video_player.dart';
import 'package:your_body_lab/models/workout_plan.model.dart';

class BottomSheetExercise extends StatelessWidget {
  final WorkoutPlan workout;
  final int index;
  const BottomSheetExercise(this.workout, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height / 1.7,
      child: Column(
        children: [
          Stack(children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(28),
              ),
              child: Stack(
                children: [
                  VideoPlayerScreen(
                    workout.exercises[index].video.url!,
                    workout.exercises[index].image.url!,
                  )
                ],
              ),
            ),
            Positioned(
                top: 10,
                right: MediaQuery.of(context).size.width / 2.2,
                left: MediaQuery.of(context).size.width / 2.2,
                child: Container(
                  width: 20,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(20, 20),
                    ),
                  ),
                )),
          ]),
          const SizedBox(
            height: 20,
          ),
          Text(
            workout.exercises[index].title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        color: Colors.black45,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        workout.exercises[index].duration,
                        style: const TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.pause,
                        color: Colors.black45,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        workout.exercises[index].rest,
                        style: const TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                width: 150,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.sports_handball_rounded,
                        color: Colors.black45,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        (workout.exercises[index].sets != null)
                            ? "${workout.exercises[index].sets}"
                            : "0",
                        style: const TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.replay_rounded,
                        color: Colors.black45,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        (workout.exercises[index].reps != null)
                            ? "${workout.exercises[index].reps}"
                            : "0",
                        style: const TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(workout.exercises[index].equipment ??
              "Nessun attrezzo necessario"),
          const SizedBox(
            height: 20,
          ),
          Text(workout.exercises[index].instructions ??
              "Nessuna istruzione disponibile"),
        ],
      ),
    );
  }
}
