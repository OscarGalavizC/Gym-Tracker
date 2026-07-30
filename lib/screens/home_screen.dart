import 'package:flutter/material.dart';
import 'package:gym_tracker/data/exercise_repository.dart';
import 'package:gym_tracker/data/session_repository.dart';
import 'package:gym_tracker/models/models.dart';
import 'package:gym_tracker/screens/log_session_screen.dart';

class HomeScreen extends StatefulWidget {
  final SessionRepository sessionRepository;
  final ExerciseRepository exerciseRepository;
  const HomeScreen({
    super.key,
    required this.sessionRepository,
    required this.exerciseRepository,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Session> get sesiones => widget.sessionRepository.getSessions();
  List<Exercise> get ejercicios => widget.exerciseRepository.getExercises();
  Map<String, double> get volumen =>
      widget.sessionRepository.weeklyVolume(ejercicios);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gym Tracker")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...sesiones.map(
              (s) => ListTile(
                title: Text('Sesion ${s.id}: \n DateTime: ${s.date}'),
              ),
            ),
            Text("Volumen de esta semana:"),
            ...volumen.entries.map(
              (m) => ListTile(title: Text('${m.key}: ${m.value} series')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => LogSessionScreen(
                sessionRepository: widget.sessionRepository,
                exerciseRepository: widget.exerciseRepository,
              ),
            ),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
