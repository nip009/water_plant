import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/homepage/components/homepage_body.dart';
import 'package:water_plant/src/screens/plants_overview/plants_overview.dart';
import 'package:water_plant/src/screens/settings/settings_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      /*appBar: GradientAppBar(
          backgroundColorStart: Colors.green[700],
          backgroundColorEnd: Colors.green[900],
          //backgroundColor: Colors.blue[800],
          title: Text("My tanks"),
          centerTitle: true,
        ),*/
      /*appBar: AppBar(
          title: Text('My tanks'),
          centerTitle: true,
        ),*/
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Constants.BOTTOM_NAVIGATION_BAR_COLOR,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: allDestinations.map((Destination destination) {
            return BottomNavigationBarItem(
              icon: Icon(destination.icon),
              title: Text(destination.title),
            );
          }).toList()),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            HomePageBody(widget.tanks),
            PlantsOverviewScreen(widget.tanks),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);
  final int index;
  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Overview', Icons.home, Colors.teal),
  Destination(1, 'Plants', Icons.filter_vintage, Colors.cyan),
  Destination(2, 'Settings', Icons.settings, Colors.orange),
];
