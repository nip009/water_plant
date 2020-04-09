import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/homepage/components/homepage_body.dart';
import 'package:water_plant/src/screens/tank_overview/tank_overview.dart';
import 'package:water_plant/src/screens/all_plants/all_plants.dart';
import 'package:water_plant/src/screens/search_plant_info/search_plant_info.dart';
import 'package:water_plant/src/screens/settings/settings_screen.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:custom_navigator/custom_navigator.dart';
import 'package:water_plant/constants.dart' as Constants;

class HomePageScreen extends StatefulWidget {
  final List<WaterTankDevice> tanks;

  HomePageScreen(this.tanks);

  static removePlantFromTank(WaterTankDevice tank, Plant plant) {
    if (tank.plants.contains(plant)) {
      tank.plants.remove(plant);
    }
  }

  removeTank(WaterTankDevice tank) {
    if (tanks.contains(tank)) {
      tanks.remove(tank);
    }
  }

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentIndex = 0;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<Map<String, dynamic>> allPlantsInfo = [
    {
      'name': 'Chinese Evergreen',
      'latinName': 'Aglaonema',
      'imageName': Constants.PLANT_CHINESE_EVERGREEN
    },
    {
      'name': 'Emerald palm',
      'latinName': 'Zamioculcas zamiifolia',
      'imageName': Constants.PLANT_EMERALD_PALM
    },
    {
      'name': 'Orchid',
      'latinName': 'Orchidaceae',
      'imageName': Constants.PLANT_ORCHID
    },
    {
      'name': 'Yucca Palm',
      'latinName': 'Yucca elephantipes',
      'imageName': Constants.PLANT_YUCCA_PALM
    },
    {
      'name': 'Cocos Palm',
      'latinName': 'Cocos nucifera',
      'imageName': Constants.PLANT_COCOS_PALM
    },
    {
      'name': 'Money Tree',
      'latinName': 'Crassula undilatifolia',
      'imageName': Constants.PLANT_MONEY_TREE
    },
    {
      'name': 'Queen Palm',
      'latinName': 'Livistonia Rotundifolia',
      'imageName': Constants.PLANT_QUEEN_PALM
    },
    {
      'name': 'Benjamin Fig',
      'latinName': 'Ficus Nitida',
      'imageName': Constants.PLANT_BENJAMIN_FIG
    },
    {
      'name': 'Bonsai Ficus',
      'latinName': 'Ficus microcarpa',
      'imageName': Constants.PLANT_BONSAI_FICUS
    },
    {
      'name': 'Janet Lind',
      'latinName': 'Dracaena Janet Lind',
      'imageName': Constants.PLANT_JANET_LIND
    },
  ];

  List<Plant> createPlants() {
    List<Plant> plants = [];
    for (int i = 0; i < allPlantsInfo.length; i++) {
      var plantInfo = allPlantsInfo[i];
      var values = plantInfo.values.toList();
      Plant plant = Plant(i * 10,
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
      HomePageBody(widget.tanks, widget.removeTank),
      AllPlantsScreen(widget.tanks),
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
