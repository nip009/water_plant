import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:water_plant/src/screens/plant_actions/components/plant_actions_body.dart';
import 'package:water_plant/src/screens/tank_overview/components/edit_plant.dart';
import 'package:water_plant/constants.dart' as Constants;

enum Options { edit_name, remove }

Options _selection = Options.remove;

/// A screen that shows the hydration level of one [Plant], and gives you
/// the possibility to water the plant by clicking a button.
class PlantActionsScreen extends StatefulWidget {
  final Plant plant;
  final WaterTankDevice tank;
  final Function callback;

  PlantActionsScreen(
      {@required this.plant, @required this.tank, @required this.callback});

  @override
  _PlantActionsScreenState createState() => _PlantActionsScreenState();
}

class _PlantActionsScreenState extends State<PlantActionsScreen> {
  refreshState() {
    setState(() {});
    widget.callback();
  }

  _navigateAndDisplaySnackbar(BuildContext context, Function goToPage) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => goToPage(),
        ));

    if (result != null) {
      Scaffold.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text("$result"),
          backgroundColor: Constants.WATER_LEVEL_FILL_LIGHT_THEME,
        ));
    }
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
        title: ClipRRect(
          //borderRadius: BorderRadius.circular(10),
          child: Container(
            height: kToolbarHeight,
            width: kToolbarHeight,
            child: Image.asset('assets/logo_white_background.png'),
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              _navigateAndDisplaySnackbar(
                context,
                () => EditPlant(
                  widget.tank,
                  widget.plant,
                  refreshState,
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.edit,
              ),
            ),
          ),
        ],
        /*actions: <Widget>[
          PopupMenuButton<Options>(
            offset: Offset.fromDirection(0, 1),
            onSelected: (Options result) {
              _selection = result;
              if (_selection == Options.edit_name) {
                print("Edit name!");
                editObjectName(
                    context: context,
                    object: widget.plant,
                    maxLength: 22,
                    callback: refreshState);
              } else if (_selection == Options.remove) {
                print("Remove!");
                OverviewScreen.removePlantFromTank(widget.tank, widget.plant);
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
        ],*/
      ),
      resizeToAvoidBottomInset:
          false, // to avoid screen being squeezed together when editing name
      body: PlantInfoBody(
          plant: widget.plant, tank: widget.tank, callback: widget.callback),
    );
  }
}
