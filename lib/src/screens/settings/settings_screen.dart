import 'package:flutter/material.dart';
import 'package:water_plant/constants.dart' as Constants;

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    Color color = isDark ? Constants.BORDER_COLOR : Colors.white;
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
                color: color,
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'NOTIFICATIONS',
                color: color,
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'WIFI',
                color: color,
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'APPEARANCE',
                color: color,
              ),
            ),
            Expanded(
              child: ChoiceButton(
                text: 'ABOUT',
                color: color,
              ),
            ),
            Spacer(),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                  ),
                  color: color,
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
    @required this.color,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      margin: EdgeInsets.all(15),
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
