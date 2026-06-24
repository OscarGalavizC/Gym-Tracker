import 'package:flutter/material.dart';
import 'package:gym_tracker/data/session_repository.dart';
import 'package:gym_tracker/screens/root_nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final repository = SessionRepository();
    return MaterialApp(
      title: "Gym Tracker",
      home: RootNavScreen(repository: repository)
      );
  }
}

