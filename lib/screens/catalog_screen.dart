import 'package:flutter/material.dart';
import 'package:gym_tracker/models/exercise.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gym Tracker")),
      body: ListView.builder(
        itemCount: sampleExercises.length,
        itemBuilder: (BuildContext context,int index) {
          return ListTile(
            title: Text(sampleExercises[index].name),
            subtitle: Text(sampleExercises[index].muscles.map((pair) => '${pair.muscle} (${pair.role.name})').join(', ')),
          );
        },
      ),
    );
  }
}