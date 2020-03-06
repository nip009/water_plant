import 'package:flutter/material.dart';
import 'package:flutter_watering/plante/plante.dart';
import 'package:flutter_watering/src/screens/homepage/components/body.dart';

class HomePage extends StatelessWidget {
  final List<MyPlant> myPlants;
  final int waterTankStatus;

  HomePage(this.myPlants, this.waterTankStatus);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(myPlants, waterTankStatus),
    );
  }
}
