import 'package:flutter/material.dart';
import 'package:water_plant/constants.dart' as Constants;

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: kToolbarHeight,
            width: kToolbarHeight,
            child: Image.asset('assets/logo_white_background.png'),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 35),
                ),
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'ACCOUNT',
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'NOTIFICATIONS',
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'WIFI',
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'APPEARANCE',
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'ABOUT',
              ),
            ),
            Spacer(),
            Expanded(
              child: Card(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Align(
                    widthFactor: 3,
                    alignment: Alignment.center,
                    child: Text(
                      "Log out",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.white,
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
