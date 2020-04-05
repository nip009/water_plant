import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/homepage/homepage.dart';
import 'package:water_plant/constants.dart' as Constants;

void main() => runApp(PlantWateringApp());

class PlantWateringApp extends StatelessWidget {
  static final List<Plant> plantsTank1 = [
    Plant(
      10,
      name: 'Chinese Evergreen',
      latinName: 'Aglaonema',
      imageName: Constants.PLANT_CHINESE_EVERGREEN,
    ),
    Plant(
      40,
      name: 'Emerald palm',
      latinName: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_EMERALD_PALM,
    ),
    Plant(
      60,
      name: 'Orchid',
      latinName: 'Orchidaceae',
      imageName: Constants.PLANT_ORCHID,
    ),
    Plant(
      0,
      name: 'Bonsai Ficus',
      latinName: 'Ficus microcarpa',
      imageName: Constants.PLANT_BONSAI_FICUS,
    ),
  ];

  static final List<Plant> plantsTank2 = [
    Plant(
      10,
      name: 'Chinese Evergreen',
      latinName: 'Aglaonema',
      imageName: Constants.PLANT_CHINESE_EVERGREEN,
    ),
    Plant(
      20,
      name: 'Emerald palm',
      latinName: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_EMERALD_PALM,
    ),
    Plant(
      60,
      name: 'Orchid',
      latinName: 'Orchidaceae',
      imageName: Constants.PLANT_ORCHID,
    ),
    Plant(
      100,
      name: 'Plante',
      latinName: 'Plante',
      imageName: Constants.PLANT_EMERALD_PALM,
    ),
  ];

  static final List<Plant> plantsTank3 = [
    Plant(
      0,
      name: 'Chinese Evergreen',
      latinName: 'Aglaonema',
      imageName: Constants.PLANT_CHINESE_EVERGREEN,
    ),
    Plant(
      10,
      name: 'Emerald palm',
      latinName: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_EMERALD_PALM,
    ),
    Plant(
      12,
      name: 'Orchid',
      latinName: 'Orchidaceae',
      imageName: Constants.PLANT_ORCHID,
    ),
    Plant(
      20,
      name: 'Plante',
      latinName: 'Plante',
      imageName: Constants.PLANT_EMERALD_PALM,
    ),
  ];

  static final List<Plant> plantsTank4 = [
    Plant(
      10,
      name: 'Chinese Evergreen',
      latinName: 'Aglaonema',
      imageName: Constants.PLANT_CHINESE_EVERGREEN,
    ),
    Plant(
      13,
      name: 'Emerald palm',
      latinName: 'Zamioculcas zamiifolia',
      imageName: Constants.PLANT_EMERALD_PALM,
    ),
    Plant(
      15,
      name: 'Orchid',
      latinName: 'Orchidaceae',
      imageName: Constants.PLANT_ORCHID,
    ),
    Plant(
      20,
      name: 'Plante',
      latinName: 'Plante',
      imageName: Constants.PLANT_EMERALD_PALM,
    ),
  ];

  final List<WaterTankDevice> waterTanks = [
    WaterTankDevice('Stue', plantsTank1, 80),
    WaterTankDevice('Soverom', plantsTank2, 50),
    WaterTankDevice('Bad', plantsTank3, 90),
    WaterTankDevice('Kjøkken', plantsTank4, 50),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Colors.grey[700],
            displayColor: Colors.grey[700],
          ),
          primaryColor: Colors.white, // chosen icon on navigation bar
          cardColor: Constants.CARD_BACKGROUND_COLOR,
          canvasColor: Constants.SCAFFOLD_BACKGROUND_COLOR,
          primaryColorDark: Colors.blue[800],
          appBarTheme: AppBarTheme(
            color: Constants.BOTTOM_NAVIGATION_BAR_COLOR,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomePageScreen(waterTanks));
  }
}
