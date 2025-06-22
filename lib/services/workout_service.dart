import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:your_body_lab/models/paginated_response.model.dart';
import 'package:http/http.dart' as http;
import 'package:your_body_lab/models/workout_plan.model.dart';

Future<PaginatedResponse<WorkoutPlan>> getWorkoutsFromDifficulty(
    String difficulty) async {
  final epWorkouts = '${dotenv.env['API_URL']}/workout_plans';
  try {
    final response = await http.get(Uri.parse(
        "$epWorkouts?where[difficulty][equals]=$difficulty&&sort=-createdAt"));

    if (response.statusCode == 200) {
      return PaginatedResponse<WorkoutPlan>.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
          WorkoutPlan.fromJsonModel);
    } else {
      throw Exception('Failed to load workouts');
    }
  } on Exception catch (_) {
    throw Exception('Failed to load workouts');
  }
}

Future<WorkoutPlan> getWorkout(String id) async {
  final epWorkouts = '${dotenv.env['API_URL']}/workout_plans';
  try {
    final response = await http.get(Uri.parse("$epWorkouts/$id"));

    if (response.statusCode == 200) {
      debugPrint(response.body);
      return WorkoutPlan.fromJsonModel(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load workout');
    }
  } on Exception catch (_) {
    throw Exception('Failed to load workout');
  }
}
