import 'package:flutter/material.dart';
import 'package:flutter_watering/src/screens/plant_information/plantinfo.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/src/components/plantinfocard.dart';
import 'package:flutter_watering/constants.dart' as Constants;

class PlantsOverviewScreenBody extends StatefulWidget {
  final List<Plant> plants;

  PlantsOverviewScreenBody(this.plants);

  @override
  _PlantsOverviewScreenStateBody createState() =>
      _PlantsOverviewScreenStateBody();
}

class _PlantsOverviewScreenStateBody extends State<PlantsOverviewScreenBody> {
  String appBarImageName = Constants.PLANT_NAME_2;

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
            for (var plant in widget.plants)
              GestureDetector(
                onTap: () {
                  /*setState(() {
          appBarImageName = plant.imageName;
        });*/
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlantInfo(plant, refresh)));
                },
                child: createPlantInfoCard(plant),
              ),
          ]),
        ),
      ],
    );
  }
}
