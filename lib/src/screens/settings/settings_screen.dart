import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Dark mode: ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                RaisedButton(
                  elevation: 8,
                  child: Text('Click me'),
                  onPressed: () {
                    print(MediaQuery.of(context).platformBrightness ==
                        Brightness.dark);
                    print("Klikk");
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
