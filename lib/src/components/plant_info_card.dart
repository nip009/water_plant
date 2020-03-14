import 'package:flutter/material.dart';
import 'package:flutter_watering/objects/plant/plant.dart';
import 'package:flutter_watering/constants.dart' as Constants;
import 'package:flutter_watering/src/components/change_name_alert_dialog.dart';
import 'package:flutter_watering/src/screens/plant_info/plant_info.dart';

enum Options { edit_name, remove }

Options _selection = Options.remove;

Widget createPlantInfoCard(
    BuildContext context, Plant plant, Function callback) {
  double x = 0;
  double y = 0;
  return Container(
    child: GestureDetector(
      onTapDown: (TapDownDetails details) {
        x = details.globalPosition.dx;
        y = details.globalPosition.dy;
      },
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                PlantInfoScreen(plant: plant, callback: callback),
          ),
        );
      },
      onLongPress: () {
        //TODO: Make use of _selection. Manage to choose either to edit name or remove.
        showMenu(
          initialValue: Options.edit_name,
          context: context,
          position: RelativeRect.fromSize(
              Rect.fromCenter(center: Offset(x, y), height: 0, width: 50),
              Size.fromWidth(50)),
          items: [
            const PopupMenuItem<Options>(
              value: Options.edit_name,
              child: Text('Edit name'),
            ),
            const PopupMenuItem<Options>(
              value: Options.remove,
              child: Text('Remove'),
            ),
          ],
        );
        if (_selection == Options.edit_name) {
          print("Edit name!");
          editObjectName(context: context, object: plant, maxLength: 25);
        } else if (_selection == Options.remove) {
          print("Remove!");
          /*setState(() {
                      widget.tank.plants.remove(plant);
                      widget.callback();
                   });*/
        }

        /*PopupMenuButton<Options>(
          offset: Offset.fromDirection(0, 1),
          onSelected: (Options result) {
            _selection = result;
            if (callback != null) {
              callback();
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
        );*/
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 8,
        margin: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
            /*border: Border.all(
              color: Constants.BORDER_COLOR,
              width: 2,
            ),*/
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          width: 120,
          height: 120,
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  border: Border.all(
                    color: Constants.BORDER_COLOR,
                    width: 1,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(plant.imageName),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
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
                          child: Row(
                            children: <Widget>[
                              for (var box in createWaterStatusBars(
                                  context, plant.hydration))
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

// Returns the bars that represent how hydrated a plant is
List<Widget> createWaterStatusBars(BuildContext context, int hydration) {
  bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
  Color emptyColor = isDark
      ? Constants.WATER_LEVEL_EMPTY_DARK_THEME
      : Constants.WATER_LEVEL_EMPTY_LIGHT_THEME;
  Color fillColor = isDark
      ? Constants.WATER_LEVEL_FILL_DARK_THEME
      : Constants.WATER_LEVEL_FILL_LIGHT_THEME;
  List<Widget> bars = [];
  for (var i = 0; i < 10; i++) {
    double hyd = hydration / 10.0;
    Color color = hyd > i ? fillColor : emptyColor;
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
