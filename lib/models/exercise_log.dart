import 'package:gym_tracker/models/set_entry.dart';

class ExerciseLog {
  final String exerciseId;
  final List<SetEntry> sets;

  const ExerciseLog({required this.exerciseId, required this.sets});

  Map<String, dynamic> toMap() => {
    'exerciseId': exerciseId,
    'sets': sets.map((s) => s.toMap()).toList(),
  };

  factory ExerciseLog.fromMap(Map<String, dynamic> map) => ExerciseLog(
    exerciseId: map['exerciseId'] as String,
    sets: (map['sets'] as List)
        .map((s) => SetEntry.fromMap(s as Map<String, dynamic>))
        .toList(),
  );
}
