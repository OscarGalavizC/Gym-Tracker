import 'package:gym_tracker/models/exercise_log.dart';

class Session {
  final String id;
  final DateTime date;
  final List<ExerciseLog> exercises;
  final int? rpe;
  final String? notes;

  const Session({
    required this.id,
    required this.date,
    required this.exercises,
    this.rpe,
    this.notes,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'date': date.toIso8601String(),
    'exercises': exercises.map((e) => e.toMap()).toList(),
    'rpe': rpe,
    'notes': notes,
  };

  factory Session.fromMap(Map<String, dynamic> map) => Session(
    id: map['id'] as String,
    date: DateTime.parse(map['date'] as String),
    exercises: (map['exercises'] as List)
        .map((s) => ExerciseLog.fromMap(s as Map<String, dynamic>))
        .toList(),
    rpe: map['rpe'] as int?,
    notes: map['notes'] as String?,
  );
}
