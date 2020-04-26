import 'package:flutter/material.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/objects/watertankdevice/water_tank_device.dart';

/// Screen for adding/editing a [WaterTankDevice].
class EditTank extends StatefulWidget {
  final Function addTank;
  final Function removeTank;

  /// To refresh the state of previous pages
  final Function refreshState;
  final bool showDeleteButton;
  final WaterTankDevice tank;
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

  List<Map<String, dynamic>> wifiInfo = [
    {
      'name': 'Get-69FAF2',
      'showIcons': true,
      'isSelected': false,
    },
    {
      'name': 'Get-6A0442',
      'showIcons': true,
      'isSelected': false,
    },
    {
      'name': 'Get-6A0572',
      'showIcons': true,
      'isSelected': false,
    },
    {
      'name': 'Get-6A1B7A',
      'showIcons': true,
      'isSelected': false,
    },
    {
      'name': 'More...',
      'showIcons': false,
      'isSelected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
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
        body: Container(
          padding: EdgeInsets.all(5),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'Device name',
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
                      initialValue:
                          widget.tank != null ? widget.tank.nickname : '',
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
                  'Networks',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              WifiCards(wifiInfo),
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
                      widget.showDeleteButton ? 'Edit Device' : 'Add Device',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[700],
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Text('Do you want to remove the tank?'),
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
                                    remove();
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                              elevation: 10,
                            ),
                          );
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
      Navigator.pop(context, 'Removed tank: ${widget.tank.nickname}');
      Navigator.pop(context);
    }
  }

  _submit(WaterTankDevice tank) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      tank.nickname = widget.tankName;
      widget.refreshState();
      Navigator.pop(context, 'Changes saved');
    }
  }

  void _editTank(WaterTankDevice tank) {
    assert(_formKey != null);
    assert(tank != null);
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Container(
          width: 200,
          child: Text('Are you sure you want to save these changes?'),
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
              _submit(tank);
            },
          ),
        ],
        elevation: 10,
      ),
    );
  }

  void _addNewTank() {
    assert(_formKey != null);
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      WaterTankDevice tank = WaterTankDevice(widget.tankName);
      widget.addTank(tank);
      Navigator.pop(context, 'Added tank: ${tank.nickname}');
    }
  }
}

class WifiCards extends StatefulWidget {
  WifiCards(
    final this.wifiInfo, {
    Key key,
  }) : super(key: key);

  final List<Map<String, dynamic>> wifiInfo;

  @override
  _WifiCardsState createState() => _WifiCardsState();
}

class _WifiCardsState extends State<WifiCards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var info in widget.wifiInfo)
          Container(
            child: wifiCard(info, widget.wifiInfo),
          ),
      ],
    );
  }

  InkWell wifiCard(Map<String, dynamic> info, allInfo) {
    return InkWell(
      onTap: () {
        setState(() {
          for (var i in widget.wifiInfo) {
            i['isSelected'] = false;
          }
          info['isSelected'] = !info['isSelected'];
        });
      },
      child: Card(
        elevation: 4,
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              info['isSelected']
                  ? Icon(Icons.check)
                  : Container(
                      width: 24,
                    ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    info['name'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              info['showIcons']
                  ? Container(
                      padding: EdgeInsets.only(right: 5),
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.wifi),
                    )
                  : Container(),
              info['showIcons']
                  ? Container(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.info_outline,
                        color:
                            Constants.CustomColors.BOTTOM_NAVIGATION_BAR_COLOR,
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
