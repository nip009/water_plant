import 'package:flutter/material.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';

/// Screen for adding a new [WaterTankDevice].
class EditTank extends StatefulWidget {
  final Function addTank;
  final Function removeTank;
  final Function refreshState;
  final bool showDeleteButton;
  WaterTankDevice tank;
  String tankName;

  EditTank(
      {this.tankName,
      this.tank,
      this.addTank,
      this.removeTank,
      this.refreshState,
      this.showDeleteButton = false});

  @override
  _EditTankState createState() => _EditTankState();
}

class _EditTankState extends State<EditTank> {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'Device name:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Container(
                  padding: EdgeInsets.only(left: 12),
                  color: Colors.white,
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      initialValue: widget.tank != null ? widget.tank.name : '',
                      maxLength: Constants.MAX_CHARS_DEVICE_NAME,
                      onSaved: (value) => widget.tankName = value,
                      validator: (value) =>
                          value.isEmpty ? 'Name cannot be empty' : null,
                      decoration: InputDecoration(
                        hintText:
                            widget.tankName == '' ? 'Default: Device 1' : '',
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(
                  'Networks:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              WifiCard(
                'Get-69FAF2',
              ),
              WifiCard(
                'Get-6A0442',
              ),
              WifiCard(
                'Get-6A0572',
              ),
              WifiCard(
                'Get-6A1B7A',
              ),
              WifiCard('More...', showIcons: false),
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
                        color: Constants.LIGHT_GREEN_COLOR,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (widget.tank == null) {
                      _addNewTank();
                    } else {
                      _editTank(widget.tank);
                    }
                  },
                ),
              ),
              widget.showDeleteButton
                  ? Container(
                      padding: EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        elevation: 4,
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.only(left: 30, right: 30),
                          child: Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        onPressed: () {
                          remove();
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  void remove() {
    assert(widget.tank != null);
    if (widget.removeTank != null) {
      widget.removeTank(widget.tank);
      widget.refreshState();
      // Pop twice to not show the old, now removed tank
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  void _editTank(WaterTankDevice tank) {
    assert(_formKey != null);
    assert(tank != null);

    if (_formKey.currentState.validate()) {
      //onSaved for the form is called and tank name is stored in _tankName.
      _formKey.currentState.save();
      print(widget.tankName);
      tank.name = widget.tankName;
      widget.refreshState();
      Navigator.pop(context);
    }
  }

  void _addNewTank() {
    assert(_formKey != null);
    if (_formKey.currentState.validate()) {
      //onSaved for the form is called and tank name is stored in _tankName.
      _formKey.currentState.save();
      print(widget.tankName);
      WaterTankDevice tank = WaterTankDevice(widget.tankName);
      widget.addTank(tank);
      Navigator.pop(context);
    }
  }
}

class WifiCard extends StatelessWidget {
  const WifiCard(this.text, {Key key, this.showIcons = true}) : super(key: key);

  final bool showIcons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 4,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              showIcons
                  ? Container(
                      padding: EdgeInsets.only(right: 5),
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.wifi),
                    )
                  : Container(),
              showIcons
                  ? Container(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.info_outline,
                        color: Constants.BOTTOM_NAVIGATION_BAR_COLOR,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
