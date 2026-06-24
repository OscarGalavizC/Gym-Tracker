import 'package:gym_tracker/models/models.dart';

class SessionRepository {
  final List<Session> _sessions = [];

  void addSession(Session session) {
    _sessions.add(session);
  }

  List<Session> getSessions() {
    return _sessions;
  }

  ExerciseLog? getLastPerformance(String exerciseId) {
    for (var session in _sessions.reversed){
      for (var log in session.exercises) {
        if (log.exerciseId == exerciseId){
          return log;
        }
      }
    }
    return null;
  }

  SessionRepository();
}