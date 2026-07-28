import 'package:gym_tracker/models/models.dart';

class ExerciseDraft {
  final Exercise exercise;
  final List<SetEntry> sets = [];
  final ExerciseLog? lastLog;

  ExerciseDraft({required this.exercise, this.lastLog});
}
