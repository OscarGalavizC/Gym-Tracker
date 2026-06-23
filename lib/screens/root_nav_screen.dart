import 'package:flutter/material.dart';

class RootNavScreen extends StatefulWidget {
  const RootNavScreen({super.key});
  
  @override
  State<RootNavScreen> createState() => _RootNavScreenState();
}

class _RootNavScreenState extends State<RootNavScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
        Card(
          child: Text("Inicio"),
        ),

        Card(
          child: Text("Catalogo"),
        ),

        Card(
          child: Text("Progreso"),
        ),
      ][_selectedIndex]
    );
  }
}