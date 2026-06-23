import 'package:gym_tracker/models/exercise_log.dart';

class Session {
  final String id;
  final DateTime date;
  final List<ExerciseLog> exercises;
  final int? rpe;
  final String? notes;

  const Session({required this.id, required this.date, required this.exercises, this.rpe, this.notes});
}