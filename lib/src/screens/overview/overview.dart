import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/overview/components/overview_body.dart';
import 'package:water_plant/src/screens/all_plants/all_plants.dart';
import 'package:water_plant/src/screens/search_plant_info/search_plant_info.dart';
import 'package:water_plant/src/screens/settings/settings_screen.dart';
import 'package:water_plant/constants.dart' as Constants;

class OverviewScreen extends StatefulWidget {
  final List<WaterTankDevice> tanks;

  OverviewScreen(this.tanks);

  static removePlantFromTank(WaterTankDevice tank, Plant plant) {
    if (tank.plants.contains(plant)) {
      tank.plants.remove(plant);
    }
  }

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<Plant> createPlants() {
    List<Plant> plants = [];
    for (int i = 0; i < Constants.ALL_PLANTS_INFORMATION.length; i++) {
      var plantInfo = Constants.ALL_PLANTS_INFORMATION[i];
      var values = plantInfo.values.toList();
      Plant plant = Plant(i * 9,
          name: values[0], latinName: values[1], imageName: values[2]);
      plants.add(plant);
    }
    return plants;
  }

  @override
  Widget build(BuildContext context) {
    var tankNames = ['Stue', 'Kjøkken', 'Bad'];

    for (int i = 0; i < tankNames.length; i++) {
      var tank = WaterTankDevice(tankNames[i]);
      widget.tanks.add(tank);
      var plants = createPlants();
      for (int i = 0; i < Constants.ALLOWED_NUMBER_OF_PLANTS_IN_TANK; i++) {
        tank.addPlant(plants[i]);
      }
    }

    var _pages = [
      OverviewBody(widget.tanks),
      AllPlantsScreen(widget.tanks),
      SearchPlantInfoScreen(widget.tanks),
      SettingsScreen(),
    ];

    return CustomScaffold(
      scaffold: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Constants.BOTTOM_NAVIGATION_BAR_COLOR,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: _items,
        ),
      ),
      //body: pages[_currentIndex],

      children: _pages,

      onItemTap: (index) {},
      /*SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            HomePageBody(widget.tanks),
            PlantsOverviewScreen(widget.tanks),
            SettingsScreen(),
            PlantsBelongingToTankScreen(
              widget.tanks.sublist(0, 1)[0],
            ),
          ],
        ),
      ),*/
    );
  }
}

double _iconSize = 25.0;
final _items = [
  BottomNavigationBarItem(
    icon: Container(
      child: ImageIcon(
        AssetImage(
          'assets/logo_white_transparent.png',
        ),
        size: _iconSize,
      ),
    ),
    title: Text('Overview'),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.view_list,
      size: _iconSize,
    ),
    title: Text('Plants'),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.search,
      size: _iconSize,
    ),
    title: Text('Search'),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.settings,
      size: _iconSize,
    ),
    title: Text('Settings'),
  ),
];
