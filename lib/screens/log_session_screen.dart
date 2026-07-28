import 'package:flutter/material.dart';
import 'package:gym_tracker/data/session_repository.dart';
import 'package:gym_tracker/models/exercise.dart';
import 'package:gym_tracker/models/exercise_log.dart';
import 'package:gym_tracker/models/models.dart';

class LogSessionScreen extends StatefulWidget {
  final SessionRepository repository;
  const LogSessionScreen({super.key, required this.repository});

  @override
  State<LogSessionScreen> createState() => _LogSessionScreenState();
}

class _ExerciseDraft {
  final Exercise exercise;
  final List<SetEntry> sets = [];

  _ExerciseDraft({required this.exercise});
}

class _LogSessionScreenState extends State<LogSessionScreen> {
  final List<_ExerciseDraft> _selectedExercises = [];
  final _pesoController = TextEditingController();
  final _repsController = TextEditingController();
  final _rirController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nueva sesión"),
        actions: [
          IconButton(
            onPressed: () {
              List<ExerciseLog> exercises = [];
              for (var exercise in _selectedExercises) {
                exercises.add(
                  ExerciseLog(
                    exerciseId: exercise.exercise.id,
                    sets: exercise.sets,
                  ),
                );
              }

              widget.repository.addSession(
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
            setState(() {
              _selectedExercises.add(_ExerciseDraft(exercise: ejercicio));
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _selectedExercises.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                Text(_selectedExercises[index].exercise.name),
                Row(
                  children: [
                    Text(
                      _selectedExercises[index].sets
                          .map(
                            (pair) =>
                                "Serie ${pair.setNumber}. Peso:${pair.weightKg} kg. Reps:${pair.reps}. RIR:${pair.rir}. Calentamiento? ${pair.isWarmup}",
                          )
                          .join('\n'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet<Exercise>(
                          context: context,
                          builder: (BuildContext context) {
                            return Card(
                              child: Column(
                                children: [
                                  TextField(
                                    controller: _pesoController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'Peso (kg)',
                                    ),
                                  ),

                                  TextField(
                                    controller: _repsController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'Repeticiones',
                                    ),
                                  ),

                                  TextField(
                                    controller: _rirController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      labelText: 'RIR',
                                    ),
                                  ),

                                  TextButton(
                                    onPressed: () {
                                      SetEntry setEntry = SetEntry(
                                        setNumber:
                                            _selectedExercises[index]
                                                .sets
                                                .length +
                                            1,
                                        isWarmup: false,
                                        weightKg: double.tryParse(
                                          _pesoController.text,
                                        ),
                                        reps: int.tryParse(
                                          _repsController.text,
                                        ),
                                        rir: int.tryParse(_rirController.text),
                                      );
                                      setState(() {
                                        _selectedExercises[index].sets.add(
                                          setEntry,
                                        );
                                      });
                                      Navigator.pop(context);
                                      _pesoController.clear();
                                      _rirController.clear();
                                      _repsController.clear();
                                    },
                                    child: Text('Guardar'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Text('Agregar serie.'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
