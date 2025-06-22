import 'exercise.model.dart';

class ExercisePerDay {
  final String day;
  final List<Exercise> exercises;

  const ExercisePerDay({
    required this.day,
    required this.exercises,
  });

  factory ExercisePerDay.fromJson(Map<String, dynamic> json) {
    return ExercisePerDay(
      day: json['day'],
      exercises: (json['exercises'] as List<dynamic>)
          .map((e) => Exercise.fromJsonModel(e as Map<String, dynamic>))
          .toList(),
    );
  }
}