import 'package:flutter/material.dart';
import 'package:flutter_watering/src/screens/plant_information/plantinfo.dart';
import 'package:flutter_watering/plante/plante.dart';
import 'package:flutter_watering/constants.dart' as Constants;

class PlantsOverviewScreenBody extends StatefulWidget {
  final List<MyPlant> myPlants;

  PlantsOverviewScreenBody(this.myPlants);

  @override
  _MyPlantsOverviewScreenStateBody createState() =>
      _MyPlantsOverviewScreenStateBody();
}

class _MyPlantsOverviewScreenStateBody extends State<PlantsOverviewScreenBody> {
  String appBarImageName = Constants.PLANT_NAME_1;

  // In order to call setState in main.dart from PlantInfo.dart
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        //SliverSafeArea(
        SliverAppBar(
          forceElevated: true,
          elevation: 8,
          expandedHeight: 280,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            /*title: Text(
                'My plants',
              ),*/
            //centerTitle: true,
            background: Image.asset(
              appBarImageName,
              fit: BoxFit.cover,
            ),
          ),
        ),
        //floating: true,
        //pinned: true,

        //),
        /*SliverToBoxAdapter(
            child: Container(
              color: Colors.yellow,
              height: 200,
            ),
          ),*/
        SliverList(
          delegate: SliverChildListDelegate([
            for (var plant in widget.myPlants)
              createPlantInfoCard(context, plant, refresh),
          ]),
        ),
      ],
    );
  }

  Widget createPlantInfoCard(
      BuildContext context, MyPlant plant, Function notifyParent) {
    return Container(
      decoration: BoxDecoration(
          //color: Colors.purple,
          //borderRadius: BorderRadius.circular(40),
          ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            appBarImageName = plant.imageName;
          });
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PlantInfo(plant, notifyParent)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 8,
          color: Colors.grey,
          margin: EdgeInsets.all(10),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            width: 120,
            height: 120,
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Image.asset(plant.imageName),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          //alignment: Alignment.centerLeft,
                          //color: Colors.white,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              plant.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        height: 40,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            alignment: Alignment.bottomCenter,
                            //color: Colors.blueGrey,
                            child: Row(
                              children: <Widget>[
                                for (var box
                                    in createWaterStatusBars(plant.hydration))
                                  Container(
                                      padding: EdgeInsets.all(5), child: box),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Returns the bars that represent how hydrated a plant is
List<Widget> createWaterStatusBars(int hydration) {
  Color emptyColor = Colors.blueGrey[100];
  Color fillColor = Colors.blue;
  List<Widget> bars = [];
  for (var i = 0; i < 10; i++) {
    Color color = hydration > i ? fillColor : emptyColor;
    bars.add(
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: color),
        width: 10,
        height: 25,
      ),
    );
  }
  return bars;
}
