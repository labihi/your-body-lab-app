import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:your_body_lab/components/error_message.dart';
import 'package:your_body_lab/components/video_player.dart';
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
                  childAspectRatio: 2.3 / 3,
                ),
                itemCount: snapshot.data!.exercises.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () => log("Long Press"),
                    onTap: () => Scaffold.of(context)
                        .showBottomSheet((context) => Container(
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
                                            snapshot.data!.exercises[index].video.url!,
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                        top: 10,
                                        right:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        left:
                                            MediaQuery.of(context).size.width /
                                                2.2,
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
                                    snapshot.data!.exercises[index].title,
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
                                                snapshot.data!.exercises[index]
                                                    .duration,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                Icons.pause,
                                                color: Colors.black45,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                snapshot.data!.exercises[index]
                                                    .rest,
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
                                                (snapshot.data!.exercises[index]
                                                            .sets !=
                                                        null)
                                                    ? "${snapshot.data!.exercises[index].sets}"
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                Icons.replay_rounded,
                                                color: Colors.black45,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                (snapshot.data!.exercises[index]
                                                            .reps !=
                                                        null)
                                                    ? "${snapshot.data!.exercises[index].reps}"
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
                                  Text(snapshot
                                          .data!.exercises[index].equipment ??
                                      "Nessun attrezzo necessario"),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(snapshot.data!.exercises[index]
                                          .instructions ??
                                      "Nessuna istruzione disponibile"),
                                ],
                              ),
                            )),
                    child: Card(
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
                              child: Image.asset(
                                "assets/images/training_stock.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "1.",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        snapshot.data!.exercises[index].title,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          snapshot
                                              .data!.exercises[index].duration,
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
                                          snapshot.data!.exercises[index].rest,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          (snapshot.data!.exercises[index]
                                                      .sets !=
                                                  null)
                                              ? "${snapshot.data!.exercises[index].sets}"
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
                                          (snapshot.data!.exercises[index]
                                                      .reps !=
                                                  null)
                                              ? "${snapshot.data!.exercises[index].reps}"
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
                    ),
                  );
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
