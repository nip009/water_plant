import 'package:flutter/material.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/overview/overview.dart';
import 'package:water_plant/constants.dart' as Constants;

void main() => runApp(PlantWateringApp());

class PlantWateringApp extends StatelessWidget {
  final List<WaterTankDevice> waterTanks = [];

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
        home: OverviewScreen(waterTanks));
  }
}
