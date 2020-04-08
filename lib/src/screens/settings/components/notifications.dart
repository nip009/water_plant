import 'package:flutter/material.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/src/screens/settings/components/widgets/form_card.dart';
import 'package:water_plant/src/screens/settings/components/widgets/form_title.dart';
import 'package:water_plant/src/screens/settings/components/widgets/page_title.dart';

/// Notification settings in Settings
class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool _pushNotificationsOn = true;
  bool _notifyCriticalMoistureLevel = true;
  bool _notifyLowMoistureLevel = false;

  bool _automaticWatering = false;
  bool _deviceWifiDisconnect = true;
  bool _lowWater = true;
  bool _lowBattery = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
          //borderRadius: BorderRadius.circular(10),
          child: Container(
            height: kToolbarHeight,
            width: kToolbarHeight,
            child: Image.asset('assets/logo_white_background.png'),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PageTitle('Notifications'),
              Row(
                children: <Widget>[
                  formTitle('Push notifications'),
                  Container(
                    child: Icon(
                      Icons.notifications,
                      color: Colors.grey[700],
                      size: 18,
                    ),
                  ),
                ],
              ),
              FormCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Turn on push notifications'),
                    Switch(
                        value: _pushNotificationsOn,
                        onChanged: (bool newValue) {
                          setState(() {
                            _pushNotificationsOn = newValue;
                          });
                        }),
                  ],
                ),
              ),
              formTitle('Reminder'),
              FormCard(
                child: Row(
                  children: <Widget>[
                    Text('Every'),
                    //30 min thingy
                  ],
                ),
              ),
              formTitle('Plants'),
              FormCard(
                height: 96,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Critical moisture level'),
                        Switch(
                            value: _notifyCriticalMoistureLevel,
                            onChanged: (bool newValue) {
                              setState(() {
                                _notifyCriticalMoistureLevel = newValue;
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Low moisture level'),
                        Switch(
                            value: _notifyLowMoistureLevel,
                            onChanged: (bool newValue) {
                              setState(() {
                                _notifyLowMoistureLevel = newValue;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              formTitle('Device'),
              FormCard(
                height: 192,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Automatic watering'),
                        Switch(
                            value: _automaticWatering,
                            onChanged: (bool newValue) {
                              setState(() {
                                _automaticWatering = newValue;
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Device WIFI disconnect'),
                        Switch(
                            value: _deviceWifiDisconnect,
                            onChanged: (bool newValue) {
                              setState(() {
                                _deviceWifiDisconnect = newValue;
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Low water'),
                        Switch(
                            value: _lowWater,
                            onChanged: (bool newValue) {
                              setState(() {
                                _lowWater = newValue;
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Low battery'),
                        Switch(
                            value: _lowBattery,
                            onChanged: (bool newValue) {
                              setState(() {
                                _lowBattery = newValue;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
