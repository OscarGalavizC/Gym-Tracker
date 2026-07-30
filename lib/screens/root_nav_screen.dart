import 'package:flutter/material.dart';
import 'package:gym_tracker/data/exercise_repository.dart';
import 'package:gym_tracker/data/session_repository.dart';
import 'package:gym_tracker/screens/catalog_screen.dart';
import 'package:gym_tracker/screens/home_screen.dart';
import 'package:gym_tracker/screens/progress_screen.dart';

class RootNavScreen extends StatefulWidget {
  final SessionRepository _sessionRepository;
  final ExerciseRepository _exerciseRepository;
  const RootNavScreen({
    super.key,
    required this._sessionRepository,
    required this._exerciseRepository,
  });

  @override
  State<RootNavScreen> createState() => _RootNavScreenState();
}

class _RootNavScreenState extends State<RootNavScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final sessionRepository = widget._sessionRepository;
    final exerciseRepository = widget._exerciseRepository;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_tree),
            icon: Icon(Icons.account_tree_outlined),
            label: 'Catalogo',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.fitness_center),
            icon: Icon(Icons.fitness_center_outlined),
            label: 'Progreso',
          ),
        ],
      ),
      body: <Widget>[
        HomeScreen(
          sessionRepository: sessionRepository,
          exerciseRepository: exerciseRepository,
        ),
        CatalogScreen(exerciseRepository: exerciseRepository),
        ProgressScreen(),
      ][_selectedIndex],
    );
  }
}
