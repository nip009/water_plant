import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/screens/homepage/homepage.dart';
import 'package:flutter_watering/src/screens/plants_overview/plants_overview.dart';
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

  final List<Plant> plants_tank3 = [
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

  final List<Plant> plants_tank4 = [
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
    WaterTankDevice tank1 = WaterTankDevice('Stue', plants_tank1, 100);
    WaterTankDevice tank2 = WaterTankDevice('Soverom', plants_tank2, 60);
    WaterTankDevice tank3 = WaterTankDevice('Bad', plants_tank3, 80);
    WaterTankDevice tank4 = WaterTankDevice('Kjøkken', plants_tank4, 20);
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
          //cardColor: Constants.CARD_BACKGROUND_COLOR,
        ),
        theme: ThemeData(
          cardColor: Constants.CARD_BACKGROUND_COLOR,
          //primaryColor: Colors.green,
          //accentColor: Colors.blue,
          //backgroundColor: Colors.orange,
          //brightness: Brightness.light,
          canvasColor: Colors.white70,
          primaryColorDark: Colors.blue[800],
          appBarTheme: AppBarTheme(
            color: Colors.green,
          ),
        ),
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(waterTanks, allPlants));
  }
}
