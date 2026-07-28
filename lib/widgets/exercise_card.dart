import 'package:flutter/material.dart';
import 'package:gym_tracker/models/models.dart';

class ExerciseCard extends StatefulWidget {
  final ExerciseDraft draft;
  final Function(SetEntry) onSetAdded;

  const ExerciseCard({
    super.key,
    required this.draft,
    required this.onSetAdded,
  });

  @override
  State<ExerciseCard> createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  final _pesoController = TextEditingController();
  final _repsController = TextEditingController();
  final _rirController = TextEditingController();

  @override
  void dispose() {
    _pesoController.dispose();
    _repsController.dispose();
    _rirController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(widget.draft.exercise.name),
          Row(
            children: [
              Text(
                "Última sesión",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          Row(
            children: [
              if (widget.draft.lastLog != null)
                Text(
                  widget.draft.lastLog!.sets
                      .map(
                        (pair) =>
                            "Serie ${pair.setNumber}. Peso:${pair.weightKg} kg. Reps:${pair.reps}. RIR:${pair.rir}. Calentamiento? ${pair.isWarmup}.",
                      )
                      .join('\n'),
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
            ],
          ),
          Row(children: [Text("SESION ACTUAL:")]),
          Row(
            children: [
              Text(
                widget.draft.sets
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
                              decoration: InputDecoration(labelText: 'RIR'),
                            ),

                            TextButton(
                              onPressed: () {
                                SetEntry setEntry = SetEntry(
                                  setNumber: widget.draft.sets.length + 1,
                                  isWarmup: false,
                                  weightKg: double.tryParse(
                                    _pesoController.text,
                                  ),
                                  reps: int.tryParse(_repsController.text),
                                  rir: int.tryParse(_rirController.text),
                                );
                                widget.onSetAdded(setEntry);
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
  }
}
