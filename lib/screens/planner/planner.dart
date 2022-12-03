import 'package:bucc_app/screens/planner/widgets/no_events.dart';
import 'package:flutter/material.dart';

class PlannerScreen extends StatefulWidget {
  const PlannerScreen({super.key});

  @override
  State<PlannerScreen> createState() => _PlannerScreenState();
}

class _PlannerScreenState extends State<PlannerScreen> {
  List _listOfEvents = [];
  @override
  Widget build(BuildContext context) => _listOfEvents.isEmpty
      ? const NoEvents()
      : SingleChildScrollView(child: Column());
}
