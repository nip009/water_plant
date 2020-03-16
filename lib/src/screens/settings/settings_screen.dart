import 'package:flutter/material.dart';
import 'package:flutter_watering/constants.dart' as Constants;

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ChoiceButton(
                text: 'WIFI',
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'Change email',
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'Change password',
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Log out",
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
              ),
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
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color color =
        isDark ? Constants.BORDER_COLOR : Constants.CARD_BACKGROUND_COLOR;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      margin: EdgeInsets.all(20),
      child: Center(
        child: Text(
          this.text,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
