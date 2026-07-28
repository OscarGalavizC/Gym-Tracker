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
