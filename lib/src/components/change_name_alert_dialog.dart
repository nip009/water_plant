import 'package:flutter/material.dart';

import 'package:water_plant/objects/IPlantAndWaterTank.dart';

Future editObjectName(
    {@required BuildContext context,
    @required IPlantAndWaterTank object,
    String title = 'Edit name',
    int maxLength = 15,
    Function callback}) {
  final _formKey = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(title),
        ),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLength: maxLength,
                  toolbarOptions: ToolbarOptions(
                    copy: true,
                    cut: true,
                    paste: true,
                    selectAll: true,
                  ),
                  decoration: const InputDecoration(),
                  onSaved: (String value) {
                    object.nickname = value;
                    if (callback != null) {
                      callback();
                    }
                    Navigator.of(context).pop();
                  },
                  initialValue: object.nickname,
                  autofocus: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("Confirm"),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
