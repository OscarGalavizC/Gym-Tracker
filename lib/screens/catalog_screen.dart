import 'package:flutter/material.dart';
import 'package:gym_tracker/data/exercise_repository.dart';
import 'package:gym_tracker/models/models.dart';

class CatalogScreen extends StatelessWidget {
  final ExerciseRepository exerciseRepository;
  const CatalogScreen({super.key, required this.exerciseRepository});

  @override
  Widget build(BuildContext context) {
    List<Exercise> ejercicios = exerciseRepository.getExercises();
    return Scaffold(
      appBar: AppBar(title: const Text("Catálogo")),
      body: ListView.builder(
        itemCount: ejercicios.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(ejercicios[index].name),
            subtitle: Text(
              ejercicios[index].muscles
                  .map(
                    (pair) =>
                        "${pair.muscle} (${pair.role == MuscleRole.primary ? 'primario' : 'secundario'})",
                  )
                  .join(', '),
            ),
          );
        },
      ),
    );
  }
}
