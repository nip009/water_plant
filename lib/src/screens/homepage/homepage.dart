import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/homepage/components/homepage_body.dart';
import 'package:water_plant/src/screens/plants_belonging_to_tank/plants_belonging_to_tank_screen.dart';
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
    var pages = [
      HomePageBody(widget.tanks),
      PlantsOverviewScreen(widget.tanks),
      SettingsScreen(),
      PlantsBelongingToTankScreen(
        widget.tanks.sublist(0, 1)[0],
      ),
    ];
    /*return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: allDestinations.map((Destination destination) {
          return BottomNavigationBarItem(
            icon: Icon(destination.icon),
            title: Text(destination.title),
          );
        }).toList(),

        // ...
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Page 1 of tab $index'),
              ),
              child: Center(
                child: CupertinoButton(
                  child: const Text('Next page'),
                  onPressed: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute<void>(
                        builder: (BuildContext context) {
                          return CupertinoPageScaffold(
                            navigationBar: CupertinoNavigationBar(
                              middle: Text('Page 2 of tab $index'),
                            ),
                            child: Center(
                              child: CupertinoButton(
                                child: const Text('Back'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );*/
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Constants.BOTTOM_NAVIGATION_BAR_COLOR,
          type: BottomNavigationBarType.fixed,
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
      body: pages[_currentIndex],
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
  Destination(3, 'Search', Icons.search, Colors.red),
];
