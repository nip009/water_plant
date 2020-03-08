import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/watertankdevice/watertankdevice.dart';
import 'package:flutter_watering/src/screens/plant_info/plantinfo.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/constants.dart' as Constants;
import 'package:flutter_watering/src/screens/plants_overview/components/plantsoverviewbody.dart';

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
