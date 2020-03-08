import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/objects/watertankdevice/watertankdevice.dart';
import 'package:flutter_watering/src/screens/homepage/homepage.dart';
import 'package:flutter_watering/src/screens/plants_overview/plantsoverview.dart';
import 'package:flutter_watering/constants.dart' as Constants;

void main() => runApp(PlantWateringApp());

class PlantWateringApp extends StatelessWidget {
  int waterTankStatus = 80;
  final List<Plant> plants_tank1 = [
    Plant(
      7,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
    Plant(
      4,
      name: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_NAME_2,
    ),
    Plant(
      6,
      name: 'Orchid',
      imageName: Constants.PLANT_NAME_4,
    ),
    Plant(
      10,
      name: 'Plante',
      imageName: Constants.PLANT_NAME_2,
    ),
  ];

  final List<Plant> plants_tank2 = [
    Plant(
      7,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
    Plant(
      4,
      name: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_NAME_2,
    ),
    Plant(
      6,
      name: 'Orchid',
      imageName: Constants.PLANT_NAME_4,
    ),
    Plant(
      10,
      name: 'Plante',
      imageName: Constants.PLANT_NAME_2,
    ),
    Plant(
      7,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<WaterTankDevice> waterTanks = [];
    WaterTankDevice tank1 = WaterTankDevice(plants_tank1, 100);
    WaterTankDevice tank2 = WaterTankDevice(plants_tank2, 100);
    waterTanks.add(tank1);
    waterTanks.add(tank2);

    List<Plant> allPlants = [];
    for (WaterTankDevice tank in waterTanks) {
      for (Plant plant in tank.plants) {
        allPlants.add(plant);
      }
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: //HomePage(waterTanks),
            //);
            PlantsOverviewScreen(allPlants));
  }
}
