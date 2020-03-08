import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/watertankdevice/watertankdevice.dart';
import 'package:flutter_watering/src/screens/homepage/components/homepagebody.dart';

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
