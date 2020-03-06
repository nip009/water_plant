import 'package:flutter/material.dart';
import 'package:flutter_watering/plante/plante.dart';
import 'package:flutter_watering/src/screens/homepage/homepage.dart';
import 'package:flutter_watering/src/screens/plants_overview/plantsoverview.dart';
import 'package:flutter_watering/constants.dart' as Constants;

void main() => runApp(PlantWateringApp());

class PlantWateringApp extends StatelessWidget {
  int waterTankStatus = 80;
  final List<MyPlant> myPlants = [
    MyPlant(
      7,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
    MyPlant(
      4,
      name: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_NAME_2,
    ),
    MyPlant(
      6,
      name: 'Orchid',
      imageName: Constants.PLANT_NAME_4,
    ),
    MyPlant(
      10,
      name: 'Plante',
      imageName: Constants.PLANT_NAME_2,
    ),
    MyPlant(
      7,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
    /*MyPlant(
      4,
      name: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_NAME_2,
    ),
    MyPlant(
      6,
      name: 'Orchid',
      imageName: Constants.PLANT_NAME_4,
    ),
    MyPlant(
      10,
      name: 'Plante',
      imageName: Constants.PLANT_NAME_2,
    ),*/
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(myPlants, waterTankStatus),
    );
    //PlantsOverviewScreen(myPlants));
  }
}
