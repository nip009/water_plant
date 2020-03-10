import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/screens/homepage/components/homepage_body.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class HomePageScreen extends StatelessWidget {
  final List<WaterTankDevice> tanks;

  HomePageScreen(this.tanks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.green[700],
        backgroundColorEnd: Colors.green[900],
        //backgroundColor: Colors.blue[800],
        title: Text("My tanks"),
        centerTitle: true,
      ),
      body: HomePageBody(tanks),
    );
  }
}
