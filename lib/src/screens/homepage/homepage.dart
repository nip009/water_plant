import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/homepage/components/homepage_body.dart';
import 'package:water_plant/src/screens/plants_belonging_to_tank/plants_belonging_to_tank.dart';
import 'package:water_plant/src/screens/plants_overview/plants_overview.dart';
import 'package:water_plant/src/screens/search_plant_info/search_plant_info.dart';
import 'package:water_plant/src/screens/settings/settings_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:water_plant/constants.dart' as Constants;

class HomePageScreen extends StatefulWidget {
  final List<WaterTankDevice> tanks;

  HomePageScreen(this.tanks);

  /// Removes the given plant from the given tank if the tank contains it.
  /// [setState] is called so that every part of the code using these will
  /// be updated.
  static removePlantFromTank(WaterTankDevice tank, Plant plant) {
    if (tank.plants.contains(plant)) {
      tank.plants.remove(plant);
    }
  }

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    var _pages = [
      HomePageBody(widget.tanks),
      PlantsOverviewScreen(widget.tanks),
      SearchPlantInfo(widget.tanks),
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
