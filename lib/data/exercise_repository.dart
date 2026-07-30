import 'dart:convert';

import 'package:gym_tracker/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExerciseRepository {
  final List<Exercise> _exercises = List.from(sampleExercises);
  static const _key = 'exercises';

  Future<void> addExercise(Exercise exercise) async {
    _exercises.add(exercise);
    final prefs = await SharedPreferences.getInstance();
    final json = _exercises.map((s) => s.toMap()).toList();
    await prefs.setString(_key, jsonEncode(json));
  }

  Future<void> loadExercises() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString != null) {
      final List decoded = jsonDecode(jsonString);
      _exercises.clear();
      _exercises.addAll(
        decoded.map((s) => Exercise.fromMap(s as Map<String, dynamic>)),
      );
    }
  }

  List<Exercise> getExercises() {
    return _exercises;
  }

  ExerciseRepository();
}
