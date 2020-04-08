import 'package:flutter/material.dart';
import 'package:water_plant/constants.dart' as Constants;
import 'package:water_plant/src/screens/settings/components/widgets/form_card.dart';
import 'package:water_plant/src/screens/settings/components/widgets/form_title.dart';
import 'package:water_plant/src/screens/settings/components/widgets/page_title.dart';

class AccountSettings extends StatefulWidget {
  @override
  _AccountSettingsState createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  final _formKeyUsername = new GlobalKey<FormState>();
  final _formKeyEmail = new GlobalKey<FormState>();
  final _formKeyMobileNumber = new GlobalKey<FormState>();

  String _userName = '';
  String _email = '';
  String _mobileNumber = '';

  bool _sendSMS = false;
  bool _sendEmail = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                pageTitle('Settings'),
                formTitle('Username'),
                FormCard(
                  child: Form(
                    key: _formKeyUsername,
                    child: TextFormField(
                      maxLength: Constants.MAX_CHARS_DEVICE_NAME,
                      onSaved: (value) => _userName = value,
                      validator: (value) =>
                          value.isEmpty ? 'Username cannot be empty' : null,
                      decoration: InputDecoration(
                        hintText: '',
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    ),
                  ),
                ),
                formTitle('E-mail address'),
                FormCard(
                  child: Form(
                    key: _formKeyEmail,
                    child: TextFormField(
                      maxLength: Constants.MAX_CHARS_DEVICE_NAME,
                      onSaved: (value) => _email = value,
                      validator: (value) =>
                          value.isEmpty ? 'Username cannot be empty' : null,
                      decoration: InputDecoration(
                        hintText: 'example@example.com',
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    ),
                  ),
                ),
                formTitle('Mobile number'),
                FormCard(
                  child: Form(
                    key: _formKeyMobileNumber,
                    child: TextFormField(
                      maxLength: Constants.MAX_CHARS_DEVICE_NAME,
                      onSaved: (value) => _mobileNumber = value,
                      validator: (value) =>
                          value.isEmpty ? 'Username cannot be empty' : null,
                      decoration: InputDecoration(
                        hintText: '111 11 111',
                        border: InputBorder.none,
                        counterText: '',
                      ),
                    ),
                  ),
                ),
                formTitle('Notification'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('SMS:'),
                    Checkbox(
                      value: _sendSMS,
                      onChanged: (bool value) {
                        setState(() {
                          _sendSMS = !_sendSMS;
                        });
                      },
                    ),
                    Text('  E-mail:'),
                    Checkbox(
                      value: _sendEmail,
                      onChanged: (bool value) {
                        setState(
                          () {
                            _sendEmail = !_sendEmail;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
