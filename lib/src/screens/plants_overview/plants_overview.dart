import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/src/screens/plants_overview/components/plants_overview_body.dart';

class PlantsOverviewScreen extends StatelessWidget {
  final List<Plant> plants;

  PlantsOverviewScreen(this.plants);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlantsOverviewScreenBody(plants),
    );
  }
}
