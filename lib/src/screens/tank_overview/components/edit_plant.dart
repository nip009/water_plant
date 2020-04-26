import 'dart:io';

import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';
import 'package:image_picker/image_picker.dart';
import 'package:water_plant/src/screens/tank_overview/components/widgets/form_title.dart';

import 'package:water_plant/constants.dart' as Constants;

class EditPlant extends StatefulWidget {
  final WaterTankDevice tank;
  final Plant plant;

  /// Refresh previous pages.
  final Function callback;

  String _plantNickname = '';
  String _selectedPlantType = '';
  String _selectedWaterTankPipe = '';
  EditPlant(this.tank, this.plant, this.callback) {
    _plantNickname = plant.nickname;
    _selectedPlantType = plant.getPlantTypeName;
    _selectedWaterTankPipe = '${tank.getPipe(plant)}';
  }

  @override
  _EditPlantState createState() => _EditPlantState();
}

class _EditPlantState extends State<EditPlant> {
  final _formKey = new GlobalKey<FormState>();

  File pictureFile;

  /// Opens the gallery on the phone and lets users choose a picture.
  imageSelectorGallery() async {
    pictureFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    print("You selected gallery image : " + pictureFile.path);
    setState(() {});
  }

  /*imageSelectorCamera() async {
    pictureFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    print("You selected camera image : " + pictureFile.path);
    setState(() {});
  }*/

  /// Shows a picture selected from phone gallery.
  Widget displaySelectedFile(File file) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () async => await imageSelectorGallery(),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
          ),
          height: 130.0,
          width: 130.0,
          child: file == null
              ? Align(
                  alignment: Alignment.center,
                  child: widget.plant.chosenImageFile == null
                      ? Image.asset(
                          widget.plant.getPlantTypeImage,
                        )
                      : Image.file(
                          widget.plant.chosenImageFile,
                          cacheHeight: 130,
                          cacheWidth: 130,
                        ),
                )
              : Image.file(
                  file,
                  cacheHeight: 130,
                  cacheWidth: 130,
                ),
        ),
      ),
    );
  }

  /// Returns all pipes available and the pipe belonging to [plant].
  ///
  /// As an example - if all four pipes in the [tank] are connected to a plant
  ///  and [plant] is connected to pipe 1 in the tank, we get ['1'] in return.
  /// ```
  /// print(getAvailablePipes(tank, plant)); // ['1']
  /// ```
  List<String> getAvailablePipes(WaterTankDevice tank, Plant plant) {
    List<String> pipes = [];
    tank.getAvailablePipes().forEach((pipe) {
      pipes.add('$pipe');
    });
    pipes.add('${tank.getPipe(plant)}');
    pipes.sort();
    return pipes;
  }

  @override
  Widget build(BuildContext context) {
    bool pressedYes = false;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            height: kToolbarHeight,
            width: kToolbarHeight,
            child: Image.asset('assets/logo_white_background.png'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    top: 30,
                  ),
                  child: displaySelectedFile(pictureFile),
                ),
                Container(
                  alignment: Alignment.center,
                  child: FlatButton(
                    child: Text(
                      'Change photo',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    onPressed: () async => await imageSelectorGallery(),
                  ),
                ),
                /*RaisedButton(
                  child: Text('Select image from camera'),
                  onPressed: () async => await imageSelectorCamera(),
                ),*/
                FormTitle('Tank pipe'),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.only(left: 12),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    child: DropdownButton<String>(
                      hint: Text('Select a pipe'),
                      value: widget._selectedWaterTankPipe,
                      items: getAvailablePipes(widget.tank, widget.plant)
                          .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          widget._selectedWaterTankPipe = value;
                        });
                      },
                      isExpanded: true,
                      underline: Container(),
                    ),
                  ),
                ),
                FormTitle('Plant name'),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.only(left: 12),
                    color: Colors.white,
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        maxLength: Constants.MAX_CHARS_DEVICE_NAME,
                        onSaved: (value) => widget._plantNickname = value,
                        validator: (value) =>
                            value.isEmpty ? 'Name cannot be empty' : null,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        initialValue: widget._plantNickname,
                      ),
                    ),
                  ),
                ),
                FormTitle('Type of plant'),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.only(left: 12),
                    alignment: Alignment.centerLeft,
                    color: Colors.white,
                    child: DropdownButton<String>(
                      value: widget._selectedPlantType,
                      items: [
                        'Chinese Evergreen',
                        'Emerald palm',
                        'Orchid',
                        'Yucca Palm',
                        'Cocos Palm',
                        'Money Tree',
                        'Queen Palm',
                        'Benjamin Fig',
                        'Bonsai Ficus',
                        'Janet Lind',
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          widget._selectedPlantType = value;
                        });
                      },
                      isExpanded: true,
                      underline: Container(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 35),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    elevation: 4,
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: Text(
                        'Edit Plant',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (widget._selectedPlantType == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: Container(
                              width: 200,
                              child: Text('Please select a plant type'),
                            ),
                            actionsPadding: EdgeInsets.symmetric(
                              horizontal: 100,
                            ),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                            elevation: 10,
                          ),
                        );
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: Container(
                            width: 200,
                            child: Text(
                                'Are you sure you want to save these changes?'),
                          ),
                          actionsPadding: EdgeInsets.symmetric(
                            horizontal: 60,
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text('Yes'),
                              onPressed: () {
                                Navigator.pop(context);
                                _submit();
                              },
                            ),
                          ],
                          elevation: 10,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  alignment: Alignment.center,
                  child: RaisedButton(
                    elevation: 4,
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Container(
                      margin: EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: Container(
                            width: 200,
                            child: Text('Delete the plant?'),
                          ),
                          actionsPadding: EdgeInsets.symmetric(
                            horizontal: 60,
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text('Yes'),
                              onPressed: () {
                                pressedYes = true;
                                if (widget.tank.removePlant(widget.plant)) {
                                  widget.callback();
                                }
                                Navigator.pop(context);
                              },
                            ),
                          ],
                          elevation: 10,
                        ),
                      );
                      if (pressedYes) {
                        Navigator.pop(
                            context, 'Deleted plant: ${widget.plant.nickname}');
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Confirm the edit.
  void _submit() {
    assert(_formKey != null);
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      var plantTypeInfo = Constants.ALL_PLANTS_INFORMATION.firstWhere(
          (element) => element['name'] == widget._selectedPlantType);

      assert(plantTypeInfo != null);
      setState(() {
        widget.plant.plantTypeInfo = plantTypeInfo;
        widget.plant.nickname = widget._plantNickname;
        widget.tank.pipeConnections[widget.plant] =
            int.parse(widget._selectedWaterTankPipe);
        if (pictureFile != null) {
          widget.plant.chosenImageFile = pictureFile;
        }
      });
      widget.callback();
      Navigator.pop(context, 'Changes saved');
    }
  }
}
