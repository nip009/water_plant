import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/screens/homepage/components/homepage_body.dart';
import 'package:flutter_watering/src/screens/plants_overview/plants_overview.dart';
import 'package:flutter_watering/src/screens/settings/settings_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

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
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                backgroundColor: destination.color);
          }).toList()),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            PlantsOverviewScreen(widget.tanks),
            HomePageBody(widget.tanks),
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
  Destination(0, 'Plants', Icons.filter_vintage, Colors.cyan),
  Destination(1, 'Home', Icons.home, Colors.teal),
  Destination(2, 'Settings', Icons.settings, Colors.orange),
];
