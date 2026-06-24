import 'package:flutter/material.dart';
import 'package:gym_tracker/data/session_repository.dart';
import 'package:gym_tracker/screens/catalog_screen.dart';
import 'package:gym_tracker/screens/home_screen.dart';
import 'package:gym_tracker/screens/progress_screen.dart';

class RootNavScreen extends StatefulWidget {
  final SessionRepository _repository;
  const RootNavScreen({super.key, required this._repository});
  
  @override
  State<RootNavScreen> createState() => _RootNavScreenState();
}

class _RootNavScreenState extends State<RootNavScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final repository = widget._repository;
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: const<Widget>[
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
        HomeScreen(repository: repository),
        CatalogScreen(),
        ProgressScreen(),
      ][_selectedIndex]
    );
  }
}