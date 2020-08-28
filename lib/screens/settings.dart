import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            child: Text('Settings'),
          ),
        ],
    );
  }
}
