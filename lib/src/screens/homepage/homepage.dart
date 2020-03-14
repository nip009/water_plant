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

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Plant> allPlants = [];
    for (WaterTankDevice tank in widget.tanks) {
      for (Plant plant in tank.plants) {
        allPlants.add(plant);
      }
    }
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
            HomePageBody(widget.tanks),
            PlantsOverviewScreen(allPlants),
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
  Destination(0, 'Home', Icons.home, Colors.teal),
  Destination(1, 'Plants', Icons.filter_vintage, Colors.cyan),
  Destination(2, 'Settings', Icons.settings, Colors.orange),
];
