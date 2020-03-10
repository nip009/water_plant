import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/src/screens/plant_info/components/plant_info_body.dart';

/// A screen that shows the hydration level of one [Plant], and gives you
/// the possibility to water the plant by clicking a button.
class PlantInfoScreen extends StatelessWidget {
  final Plant plant;

  PlantInfoScreen({@required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(plant.name),
        centerTitle: true,
      ),
      body: PlantInfoBody(plant: plant),
    );
  }
}