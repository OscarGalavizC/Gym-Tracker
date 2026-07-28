import 'package:flutter/material.dart';
import 'package:gym_tracker/data/session_repository.dart';
import 'package:gym_tracker/models/models.dart';
import 'package:gym_tracker/widgets/exercise_card.dart';

class LogSessionScreen extends StatefulWidget {
  final SessionRepository repository;
  const LogSessionScreen({super.key, required this.repository});

  @override
  State<LogSessionScreen> createState() => _LogSessionScreenState();
}

class _LogSessionScreenState extends State<LogSessionScreen> {
  final List<ExerciseDraft> _selectedExercises = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nueva sesión"),
        actions: [
          IconButton(
            onPressed: () async {
              List<ExerciseLog> exercises = [];
              for (var exercise in _selectedExercises) {
                exercises.add(
                  ExerciseLog(
                    exerciseId: exercise.exercise.id,
                    sets: exercise.sets,
                  ),
                );
              }

              await widget.repository.addSession(
                Session(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  date: DateTime.now(),
                  exercises: exercises,
                ),
              );

              Navigator.pop(context);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final ejercicio = await showModalBottomSheet<Exercise>(
            context: context,
            builder: (_) => ListView.builder(
              itemCount: sampleExercises.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(sampleExercises[index].name),
                  onTap: () {
                    Navigator.pop(context, sampleExercises[index]);
                  },
                );
              },
            ),
          );
          if (ejercicio != null) {
            final lastLog = widget.repository.getLastPerformance(ejercicio.id);
            setState(() {
              _selectedExercises.add(
                ExerciseDraft(exercise: ejercicio, lastLog: lastLog),
              );
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _selectedExercises.length,
        itemBuilder: (context, index) {
          return ExerciseCard(
            draft: _selectedExercises[index],
            onSetAdded: (setEntry) {
              setState(() {
                _selectedExercises[index].sets.add(setEntry);
              });
            },
          );
        },
      ),
    );
  }
}
