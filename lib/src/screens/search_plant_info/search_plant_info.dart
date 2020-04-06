import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/src/screens/plant_hero/plant_hero.dart';

class SearchPlantInfo extends StatelessWidget {
  final List<WaterTankDevice> tanks;

  SearchPlantInfo(this.tanks) {
    for (WaterTankDevice tank in tanks) {
      assert(tank != null);
    }
  }

  /// List over all the plants that the app should know about.
  /// Can search through these to find information about them.
  /// In the future this would be fetched from a database.
  final List<Plant> allPlants = [
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
      0,
      name: 'Bonsai Ficus',
      latinName: 'Ficus microcarpa',
      imageName: Constants.PLANT_BONSAI_FICUS,
    ),
    Plant(
      0,
      name: 'Cocos Palm',
      latinName: 'Cocos nucifera',
      imageName: Constants.PLANT_COCOS_PALM,
    ),
    Plant(
      0,
      name: 'Money Tree',
      latinName: 'Crassula undilatifolia ',
      imageName: Constants.PLANT_MONEY_TREE,
    ),
    Plant(
      0,
      name: 'Queen Palm',
      latinName: 'Livistonia Rotundifolia',
      imageName: Constants.PLANT_QUEEN_PALM,
    ),
    Plant(
      0,
      name: 'Benjamin Fig',
      latinName: 'Ficus Nitida',
      imageName: Constants.PLANT_BENJAMIN_FIG,
    ),
    Plant(
      0,
      name: 'Yucca Palm',
      latinName: 'Yucca elephantipes',
      imageName: Constants.PLANT_YUCCA_PALM,
    ),
    Plant(
      0,
      name: 'Janet Lind',
      latinName: 'Dracaena Janet Lind',
      imageName: Constants.PLANT_JANET_LIND,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: kToolbarHeight,
            width: kToolbarHeight,
            child: Image.asset('assets/logo_white_background.png'),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(allPlants),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          for (Plant plant in allPlants) createPlantCard(context, plant),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(
    this.allPlants, {
    String hintText,
  }) : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  List<Plant> allPlants;
  List<Plant> history = [];

  List<Plant> searchForPlants(String name) {
    List<Plant> found = [];
    for (Plant p in allPlants) {
      if (p.name.toLowerCase().contains(name.toLowerCase())) {
        found.add(p);
      }
    }
    return found;
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Constants.BOTTOM_NAVIGATION_BAR_COLOR,
      primaryIconTheme: theme.primaryIconTheme,
      primaryColorBrightness: theme.primaryColorBrightness,
      primaryTextTheme: theme.primaryTextTheme,
    );
  }

  @override
  Widget buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        },
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    if (this.query == '') {
      return ListView(
        children: <Widget>[
          for (Plant plant in allPlants) createPlantCard(context, plant),
        ],
      );
    } else {
      List<Plant> foundPlants = searchForPlants(this.query);
      return ListView(
        children: <Widget>[
          for (Plant plant in foundPlants) createPlantCard(context, plant),
        ],
      );
    }
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Plant> foundPlants = searchForPlants(this.query);
    return ListView(
      children: <Widget>[
        for (Plant plant in foundPlants) createPlantCard(context, plant),
      ],
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) => [
        this.query.length > 0
            ? Container(
                child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    this.query = '';
                  },
                ),
              )
            : Container(),
      ];
}

Widget createPlantCard(BuildContext context, Plant plant) {
  return Container(
    padding: EdgeInsets.only(top: 2, bottom: 2),
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return PlantHeroScreen(plant);
            },
          ),
        );
      },
      child: Card(
        elevation: 5,
        //margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        color: Colors.grey[100],
        child: Container(
          padding: const EdgeInsets.all(0),
          height: 80,
          child: Row(
            children: <Widget>[
              Image.asset(plant.imageName),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              plant.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            '${plant.latinName}',
                            style: TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

/*Widget createPlantCard(Plant plant) {
  return GestureDetector(
    onTap: () {
      print('${plant.name}');
    },
    child: Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: 120,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
          ),
          child: Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(width: 1),
                ),
                child: Image.asset(plant.imageName),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '${plant.name.toUpperCase()}',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '${plant.latinName}',
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}*/
