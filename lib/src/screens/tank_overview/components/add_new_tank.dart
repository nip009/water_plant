import 'package:flutter/material.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';

/// Screen for adding a new [WaterTankDevice].
class AddNewTank extends StatefulWidget {
  final Function addTank;

  AddNewTank(this.addTank);

  @override
  _AddNewTankState createState() => _AddNewTankState();
}

class _AddNewTankState extends State<AddNewTank> {
  final _formKey = new GlobalKey<FormState>();

  String _tankName = '';

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
                      maxLength: Constants.MAX_CHARS_DEVICE_NAME,
                      onSaved: (value) => _tankName = value,
                      validator: (value) =>
                          value.isEmpty ? 'Name cannot be empty' : null,
                      decoration: InputDecoration(
                        hintText: 'Default: Device 1',
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
                      'CONFIRM',
                      style: TextStyle(
                        fontSize: 20,
                        color: Constants.LIGHT_GREEN_COLOR,
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
      print(_tankName);
      WaterTankDevice tank = WaterTankDevice(_tankName);
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
