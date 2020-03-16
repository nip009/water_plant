import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/src/components/plant_info_card.dart';
import 'package:flutter_watering/constants.dart' as Constants;

/// A list overview of every single plant owned.
class PlantsOverviewScreenBody extends StatefulWidget {
  final List<WaterTankDevice> tanks;

  PlantsOverviewScreenBody(this.tanks);

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
    //sort(allPlantsInTanks.values);
    return Container(
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
              for (WaterTankDevice tank in widget.tanks)
                for (Plant plant in tank.plants)
                  createPlantInfoCard(context, plant, tank, refreshState),
            ]),
          ),
        ],
      ),
    );
  }
}
