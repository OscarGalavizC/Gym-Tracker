import 'package:gym_tracker/models/set_entry.dart';

class ExerciseLog {
  final String exerciseId;
  final List<SetEntry> sets;

  const ExerciseLog({required this.exerciseId, required this.sets});
}