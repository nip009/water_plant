import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/watertankdevice/watertankdevice.dart';
import 'package:flutter_watering/src/screens/homepage/components/homepagebody.dart';

class HomePage extends StatelessWidget {
  final List<WaterTankDevice> tanks;

  HomePage(this.tanks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(tanks),
    );
  }
}
