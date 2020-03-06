import 'package:flutter/material.dart';
import 'package:flutter_watering/src/screens/plant_information/plantinfo.dart';
import 'package:flutter_watering/plante/plante.dart';
import 'package:flutter_watering/constants.dart' as Constants;
import 'package:flutter_watering/src/screens/plants_overview/components/body.dart';

class PlantsOverviewScreen extends StatelessWidget {
  final List<MyPlant> myPlants;

  PlantsOverviewScreen(this.myPlants);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlantsOverviewScreenBody(myPlants),
    );
  }
}
