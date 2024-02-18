import 'package:your_body_lab/models/area.model.dart';
import 'package:your_body_lab/models/media.model.dart';

class Exercise {
  final String id;
  final String title;
  final String? instructions;
  final int? sets;
  final int? reps;
  final String? equipment;
  final String rest;
  final Area area;
  final String duration;
  final Media video;
  final Media image;

  const Exercise({
    required this.id,
    required this.title,
    required this.instructions,
    required this.sets,
    required this.reps,
    required this.equipment,
    required this.rest,
    required this.area,
    required this.duration,
    required this.video,
    required this.image,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      id: json['id'] as String,
      title: json['title'],
      instructions: json['instructions'],
      sets: json['sets'],
      reps: json['reps'],
      equipment: json['equipment'],
      rest: json['rest'],
      area: Area.fromJson(json['area'] as Map<String, dynamic>),
      duration: json['duration'],
      video: Media.fromJson(json['video'] as Map<String, dynamic>),
      image: Media.fromJson(json['image'] as Map<String, dynamic>),
    );
  }

  static Exercise fromJsonModel(Map<String, dynamic> json) =>
      Exercise.fromJson(json);
}
