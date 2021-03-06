import 'package:flutter/material.dart';
import 'package:water_plant/src/screens/settings/components/widgets/page_title.dart';
import 'package:water_plant/constants.dart' as Constants;

/// About screen in Settings
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: kToolbarHeight,
          width: kToolbarHeight,
          child: Image.asset('assets/logo_white_background.png'),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: PageTitle(
                'About',
                alignment: Alignment.topCenter,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Water',
                            style: TextStyle(
                              fontSize: 24,
                              color: Constants.WATER_LEVEL_FILL_LIGHT_THEME,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'Plant',
                            style: TextStyle(
                              fontSize: 24,
                              color: Constants.LIGHT_GREEN_COLOR,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Version 1.1',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
