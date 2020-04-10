import 'package:flutter/material.dart';
import 'package:water_plant/objects/plant/plant.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';

import 'package:water_plant/constants.dart' as Constants;

class AddNewPlant extends StatefulWidget {
  WaterTankDevice tank;
  Function addNewPlant;

  AddNewPlant(this.tank, this.addNewPlant);
  @override
  _AddNewPlantState createState() => _AddNewPlantState();
}

class _AddNewPlantState extends State<AddNewPlant> {
  final _formKey = new GlobalKey<FormState>();

  String _plantName = '';

  // needs to be null because the value in DropdownButton needs to be null at first
  String _selectedPlantType;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 2),
                child: Text(
                  'Plant name',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
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
                      onSaved: (value) => _plantName = value,
                      validator: (value) =>
                          value.isEmpty ? 'Name cannot be empty' : null,
                      decoration: InputDecoration(
                        hintText: 'Default: Plant 1',
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 2),
                child: Text(
                  'Type of plant',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: EdgeInsets.all(0),
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  alignment: Alignment.centerLeft,
                  color: Colors.white,
                  child: DropdownButton<String>(
                    //isDense: true,
                    hint: Text('Select a plant type'),
                    value: _selectedPlantType,
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
                        _selectedPlantType = value;
                      });
                    },
                    isExpanded: true,
                    underline: Container(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                child: RaisedButton(
                  elevation: 4,
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  onPressed: () {
                    _submit();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    assert(_formKey != null);
    if (_formKey.currentState.validate()) {
      //onSaved for the form is called and tank name is stored in _tankName.
      _formKey.currentState.save();

      Plant plant = Plant(
        0,
        name: _plantName,
        latinName: 'latinsk navn',
        imageName: Constants.PLANT_BENJAMIN_FIG,
      );
      widget.addNewPlant(plant);
      Navigator.pop(context);
    }
  }
}
