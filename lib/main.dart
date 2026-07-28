import 'package:flutter/material.dart';
import 'package:gym_tracker/data/session_repository.dart';
import 'package:gym_tracker/screens/root_nav_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = SessionRepository();
  await repository.loadSessions();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final SessionRepository repository;
  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gym Tracker",
      home: RootNavScreen(repository: repository),
    );
  }
}
