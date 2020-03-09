import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/screens/homepage/components/homepage_body.dart';

class HomePageScreen extends StatelessWidget {
  final List<WaterTankDevice> tanks;

  HomePageScreen(this.tanks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(tanks),
    );
  }
}
