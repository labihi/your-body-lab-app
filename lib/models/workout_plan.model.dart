import 'package:your_body_lab/models/exercise.model.dart';
import 'package:your_body_lab/models/media.model.dart';
import 'package:your_body_lab/models/tag.model.dart';

class WorkoutPlan {
  final String id;
  final String title;
  final String? usefulTips;
  final List<Exercise> exercises;
  final String totalDuration;
  final Media image;
  final String goal;
  final String difficulty;
  final String daysPerWeek;
  final List<Tag>? tags;

  const WorkoutPlan({
    required this.id,
    required this.title,
    required this.usefulTips,
    required this.exercises,
    required this.totalDuration,
    required this.image,
    required this.goal,
    required this.difficulty,
    required this.daysPerWeek,
    required this.tags,
  });

  factory WorkoutPlan.fromJson(Map<String, dynamic> json) {
    return WorkoutPlan(
      id: json['id'] as String,
      title: json['title'],
      usefulTips: json['useful_tips'],
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJsonModel(e as Map<String, dynamic>))
          .toList(),
      totalDuration: json['total_duration'],
      image: Media.fromJson(json['image'] as Map<String, dynamic>),
      goal: json['goal'],
      difficulty: json['difficulty'],
      daysPerWeek: json['days_per_week'],
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJsonModel(e as Map<String, dynamic>))
          .toList(),
    );
  }

  static WorkoutPlan fromJsonModel(Map<String, dynamic> json) =>
      WorkoutPlan.fromJson(json);
}
