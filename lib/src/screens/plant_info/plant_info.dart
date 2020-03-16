import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/objects/watertankdevice/water_tank_device.dart';
import 'package:flutter_watering/src/components/change_name_alert_dialog.dart';
import 'package:flutter_watering/src/screens/plant_info/components/plant_info_body.dart';
import 'package:flutter_watering/src/screens/homepage/homepage.dart';

enum Options { edit_name, remove }

Options _selection = Options.remove;

/// A screen that shows the hydration level of one [Plant], and gives you
/// the possibility to water the plant by clicking a button.
class PlantInfoScreen extends StatefulWidget {
  final Plant plant;
  final WaterTankDevice tank;
  final Function callback;

  PlantInfoScreen(
      {@required this.plant, @required this.tank, @required this.callback});

  @override
  _PlantInfoScreenState createState() => _PlantInfoScreenState();
}

class _PlantInfoScreenState extends State<PlantInfoScreen> {
  refreshState() {
    setState(() {});
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          PopupMenuButton<Options>(
            offset: Offset.fromDirection(0, 1),
            onSelected: (Options result) {
              _selection = result;
              if (_selection == Options.edit_name) {
                print("Edit name!");
                editObjectName(
                    context: context,
                    object: widget.plant,
                    maxLength: 25,
                    callback: refreshState);
              } else if (_selection == Options.remove) {
                print("Remove!");
                HomePageScreen.removePlantFromTank(widget.tank, widget.plant);
                refreshState();
                Navigator.pop(context);
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Options>>[
              const PopupMenuItem<Options>(
                value: Options.edit_name,
                child: Text('Edit name'),
              ),
              const PopupMenuItem<Options>(
                value: Options.remove,
                child: Text('Remove'),
              ),
            ],
          ),
        ],
        title: Text(widget.plant.name),
        centerTitle: true,
        bottom: PreferredSize(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 7,
            ),
            child: Text('${widget.tank.name}'),
          ),
          preferredSize: Size.fromHeight(3),
        ),
      ),
      resizeToAvoidBottomInset:
          false, // to avoid screen being squeezed together when editing name
      body: PlantInfoBody(plant: widget.plant, callback: widget.callback),
    );
  }
}
