import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/homepage/homepage.dart';
import 'package:water_plant/constants.dart' as Constants;

void main() => runApp(PlantWateringApp());

class PlantWateringApp extends StatelessWidget {
  static final List<Plant> plantsTank1 = [
    Plant(
      70,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
    Plant(
      40,
      name: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_NAME_2,
    ),
    Plant(
      60,
      name: 'Orchid',
      imageName: Constants.PLANT_NAME_4,
    ),
    Plant(
      100,
      name: 'Plante',
      imageName: Constants.PLANT_NAME_2,
    ),
  ];

  static final List<Plant> plantsTank2 = [
    Plant(
      70,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
    Plant(
      40,
      name: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_NAME_2,
    ),
    Plant(
      60,
      name: 'Orchid',
      imageName: Constants.PLANT_NAME_4,
    ),
    Plant(
      100,
      name: 'Plante',
      imageName: Constants.PLANT_NAME_2,
    ),
    Plant(
      70,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
  ];

  static final List<Plant> plantsTank3 = [
    Plant(
      70,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
    Plant(
      40,
      name: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_NAME_2,
    ),
    Plant(
      60,
      name: 'Orchid',
      imageName: Constants.PLANT_NAME_4,
    ),
    Plant(
      100,
      name: 'Plante',
      imageName: Constants.PLANT_NAME_2,
    ),
    Plant(
      70,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
  ];

  static final List<Plant> plantsTank4 = [
    Plant(
      70,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
    Plant(
      40,
      name: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_NAME_2,
    ),
    Plant(
      60,
      name: 'Orchid',
      imageName: Constants.PLANT_NAME_4,
    ),
    Plant(
      100,
      name: 'Plante',
      imageName: Constants.PLANT_NAME_2,
    ),
    Plant(
      70,
      name: 'Chinese Evergreen',
      imageName: Constants.PLANT_NAME_1,
    ),
  ];

  final List<WaterTankDevice> waterTanks = [
    WaterTankDevice('Stue', plantsTank1, 100),
    WaterTankDevice('Soverom', plantsTank2, 60),
    WaterTankDevice('Bad', plantsTank3, 80),
    WaterTankDevice('Kjøkken', plantsTank4, 50),
  ];

  @override
  Widget build(BuildContext context) {
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
            color: Constants.BOTTOM_NAVIGATION_BAR_COLOR,
          ),
        ),
        //themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(waterTanks));
  }
}
