import 'package:flutter/material.dart';
import 'package:gym_tracker/data/session_repository.dart';

class HomeScreen extends StatelessWidget {
  final SessionRepository repository;
  const HomeScreen({super.key, required this.repository});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gym Tracker")),
      body: const Center(child: Text("Home")),
    );
  }
}