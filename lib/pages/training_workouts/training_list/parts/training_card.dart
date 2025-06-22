import 'package:flutter/material.dart';
import 'package:your_body_lab/models/tag.model.dart';
import 'package:your_body_lab/services/image.service.dart';

class TrainingCard extends StatelessWidget {
  final String title;
  final String image;
  final String duration;
  final String daysPerWeek;
  final List<Tag> goals;

  const TrainingCard(
      {super.key,
      required this.title,
      required this.image,
      required this.duration,
      required this.daysPerWeek,
      required this.goals});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      //adjust the height of the card to fit the content
      height: MediaQuery.of(context).textScaler.scale(20) * 12,
      child: Card(
        surfaceTintColor: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  image: NetworkImage(getMediaUrl(image)),
                  width: 120,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.black45,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              duration,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.replay_rounded,
                              color: Colors.black45,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              daysPerWeek,
                              style: const TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
