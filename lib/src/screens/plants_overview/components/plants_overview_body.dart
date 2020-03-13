import 'package:flutter/material.dart';
import 'package:flutter_watering/src/screens/plant_info/plant_info.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/src/components/plant_info_card.dart';
import 'package:flutter_watering/constants.dart' as Constants;

/// A list overview of every single plant owned.
class PlantsOverviewScreenBody extends StatefulWidget {
  List<Plant> plants;

  PlantsOverviewScreenBody(this.plants);

  @override
  _PlantsOverviewScreenStateBody createState() =>
      _PlantsOverviewScreenStateBody();
}

class _PlantsOverviewScreenStateBody extends State<PlantsOverviewScreenBody> {
  String appBarImageName = Constants.PLANT_NAME_2;

  /// Sort plants by hydration
  List<Plant> sort(List<Plant> plants) {
    plants.sort((a, b) => a.hydration.compareTo(b.hydration));
    return plants;
  }

  refreshState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    sort(widget.plants);
    return Container(
      //color: Colors.white70,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            elevation: 8,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Image.asset(
                appBarImageName,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              for (var plant in widget.plants)
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PlantInfoScreen(
                                plant: plant, callback: refreshState)));
                  },
                  child: createPlantInfoCard(context, plant),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
