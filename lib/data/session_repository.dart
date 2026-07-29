import 'package:gym_tracker/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SessionRepository {
  final List<Session> _sessions = [];
  static const _key = 'sessions';

  Future<void> addSession(Session session) async {
    _sessions.add(session);
    final prefs = await SharedPreferences.getInstance();
    final json = _sessions.map((s) => s.toMap()).toList();
    await prefs.setString(_key, jsonEncode(json));
  }

  Future<void> loadSessions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString != null) {
      final List decoded = jsonDecode(jsonString);
      _sessions.clear();
      _sessions.addAll(
        decoded.map((s) => Session.fromMap(s as Map<String, dynamic>)),
      );
    }
  }

  List<Session> getSessions() {
    return _sessions;
  }

  Map<String, double> weeklyVolume(List<Exercise> exercises) {
    final Map<String, double> volumen = {};

    final now = DateTime.now();
    final weekStart = DateTime(
      now.year,
      now.month,
      now.day - (now.weekday - 1),
    );

    for (var session in _sessions.where((s) => s.date.isAfter(weekStart))) {
      for (var exerciseLog in session.exercises) {
        final ejercicio = exercises.firstWhere(
          (s) => s.id == exerciseLog.exerciseId,
        );
        for (var set in exerciseLog.sets) {
          if (set.isWarmup == false) {
            for (var muscle in ejercicio.muscles) {
              if (muscle.role == MuscleRole.primary) {
                volumen[muscle.muscle] = (volumen[muscle.muscle] ?? 0) + 1.0;
              }
              if (muscle.role == MuscleRole.secondary) {
                volumen[muscle.muscle] = (volumen[muscle.muscle] ?? 0) + 0.5;
              }
            }
          }
        }
      }
    }

    return volumen;
  }

  ExerciseLog? getLastPerformance(String exerciseId) {
    for (var session in _sessions.reversed) {
      for (var log in session.exercises) {
        if (log.exerciseId == exerciseId) {
          return log;
        }
      }
    }
    return null;
  }

  SessionRepository();
}
