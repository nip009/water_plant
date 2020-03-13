import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/screens/homepage/homepage.dart';
import 'package:flutter_watering/constants.dart' as Constants;

void main() => runApp(PlantWateringApp());

class PlantWateringApp extends StatelessWidget {
  final List<Plant> plantsTank1 = [
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

  final List<Plant> plantsTank2 = [
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

  final List<Plant> plantsTank3 = [
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

  final List<Plant> plantsTank4 = [
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
    WaterTankDevice tank1 = WaterTankDevice('Stue', plantsTank1, 100);
    WaterTankDevice tank2 = WaterTankDevice('Soverom', plantsTank2, 60);
    WaterTankDevice tank3 = WaterTankDevice('Bad', plantsTank3, 80);
    WaterTankDevice tank4 = WaterTankDevice('Kjøkken', plantsTank4, 40);
    waterTanks.add(tank1);
    waterTanks.add(tank2);
    waterTanks.add(tank3);
    waterTanks.add(tank4);

    List<Plant> allPlants = [];
    for (WaterTankDevice tank in waterTanks) {
      for (Plant plant in tank.plants) {
        allPlants.add(plant);
      }
    }

    return MaterialApp(
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          //cardColor: Colors.grey[850],
        ),
        theme: ThemeData(
          cardColor: Constants.CARD_BACKGROUND_COLOR,
          canvasColor: Colors.white70,
          primaryColorDark: Colors.blue[800],
          appBarTheme: AppBarTheme(
            color: Colors.green,
          ),
        ),
        //themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(waterTanks, allPlants));
  }
}
