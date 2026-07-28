import 'package:flutter/material.dart';
import 'package:gym_tracker/data/session_repository.dart';
import 'package:gym_tracker/models/models.dart';
import 'package:gym_tracker/screens/log_session_screen.dart';

class HomeScreen extends StatefulWidget {
  final SessionRepository repository;
  const HomeScreen({super.key, required this.repository});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Session> get sesiones => widget.repository.getSessions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Gym Tracker")),
      body: ListView.builder(
        itemCount: sesiones.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Sesion $index: \n DateTime: ${sesiones[index].date}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => LogSessionScreen(repository: widget.repository),
            ),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
