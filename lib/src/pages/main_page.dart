import 'package:flutter/material.dart';

import '../components/grid_component.dart';
import '../components/control_component.dart';

class MainPage extends StatefulWidget {
  createState() => _MainPageState();
}

class _MainPageState extends State<StatefulWidget> {
  final snackBar = SnackBar(
    duration: Duration(milliseconds: 500),
    content: Text(
      '¡¡El robot se salió del área!!',
      style: TextStyle(fontSize: 20),
    ),
  );
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<int> coords = [1, 1]; // [x, y]
  final List<int> limits = [2, 2]; // [maxX, maxY]

  directionHandler(String direction) {
    switch (direction) {
      case "up":
        setState(() {
          coords[1]--;
          if (coords[1] <= -1) {
            coords = [1, 1];
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
        });
        break;

      case "down":
        setState(() {
          coords[1]++;
          if (coords[1] >= 3) {
            coords = [1, 1];
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
        });
        break;

      case "left":
        setState(() {
          coords[0]--;
          if (coords[0] <= -1) {
            coords = [1, 1];
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
        });
        break;

      case "right":
        setState(() {
          coords[0]++;
          if (coords[0] >= 3) {
            coords = [1, 1];
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
        });
        break;
    }
  }

  Widget build(context) {
    //scaffoldOfContext = Scaffold.of(context);
    return Scaffold(
        key: _scaffoldKey,
        body: Column(
          children: [
            GridComponent(
              gridInfo: coords,
            ),
            ControlComponent(
              directionHandler: this.directionHandler,
            )
          ],
        ));
  }
}
