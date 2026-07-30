import 'package:flutter/material.dart';
import 'package:gym_tracker/data/exercise_repository.dart';
import 'package:gym_tracker/data/session_repository.dart';
import 'package:gym_tracker/screens/root_nav_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sessionsRepository = SessionRepository();
  final exercisesRepository = ExerciseRepository();
  await sessionsRepository.loadSessions();
  await exercisesRepository.loadExercises();
  runApp(
    MyApp(
      sessionsRepository: sessionsRepository,
      exerciseRepository: exercisesRepository,
    ),
  );
}

class MyApp extends StatelessWidget {
  final SessionRepository sessionsRepository;
  final ExerciseRepository exerciseRepository;
  const MyApp({
    super.key,
    required this.sessionsRepository,
    required this.exerciseRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gym Tracker",
      home: RootNavScreen(
        sessionRepository: sessionsRepository,
        exerciseRepository: exerciseRepository,
      ),
    );
  }
}
