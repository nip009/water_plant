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
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: kToolbarHeight,
            width: kToolbarHeight,
            child: Image.asset('assets/logo_white_background.png'),
          ),
        ),
        centerTitle: true,
      ),
      body: PlantsOverviewScreenBody(tanks),
    );
  }
}
