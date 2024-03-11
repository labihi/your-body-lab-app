import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:your_body_lab/models/workout_plan.model.dart';
import 'package:your_body_lab/services/image.service.dart';

class ExerciseCard extends StatelessWidget {
  final WorkoutPlan workout;
  final int index;
  const ExerciseCard(this.workout, this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.grey.shade100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10),
            ),
            child: SizedBox(
                width: double.infinity,
                height: 130,
                child: Image(
                  image: CachedNetworkImageProvider(
                      getMediaUrl(workout.exercises[index].image.url)),
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}.",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        workout.exercises[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Row(
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
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
