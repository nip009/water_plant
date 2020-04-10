import 'package:flutter/material.dart';
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';

import 'package:water_plant/constants.dart' as Constants;

class AddNewPlant extends StatefulWidget {
  WaterTankDevice tank;

  AddNewPlant(this.tank);
  @override
  _AddNewPlantState createState() => _AddNewPlantState();
}

class _AddNewPlantState extends State<AddNewPlant> {
  final _formKey = new GlobalKey<FormState>();

  String _plantName = '';
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
                child: Text('Plant name'),
              ),
              Card(
                elevation: 5,
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
                padding: EdgeInsets.only(top: 10),
                child: Text('Type of plant'),
              ),
              DropdownButton<String>(
                items: <String>['A', 'B', 'C', 'D'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              )
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
      print(_plantName);
      WaterTankDevice tank = WaterTankDevice(_plantName);
      //widget.addPlant(plant);
      Navigator.pop(context);
    }
  }
}
