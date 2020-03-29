import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/plants_overview/components/plants_overview_body.dart';

class PlantsOverviewScreen extends StatelessWidget {
  final List<WaterTankDevice> tanks;

  PlantsOverviewScreen(this.tanks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlantsOverviewScreenBody(tanks),
    );
  }
}
