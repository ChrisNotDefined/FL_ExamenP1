import "package:flutter/material.dart";

class ControlComponent extends StatefulWidget {
  final Function(String) directionHandler;

  ControlComponent({this.directionHandler});

  @override
  createState() {
    // TODO: implement createState
    return _ControlComponent();
  }
}

class _ControlComponent extends State<ControlComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: GridView.count(
          childAspectRatio: 1.2,
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(9, (int position) => _controlGap(position))),
    );
  }

  Widget _controlGap(index) {
    switch (index) {
      case 1:
        return Container(
          child: FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              this.widget.directionHandler('up');
            },
            child: Icon(
              Icons.arrow_drop_up,
              size: 50,
            ),
          ),
        );
        break;
      case 3:
        return Container(
          child: FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              this.widget.directionHandler('left');
            },
            child: Icon(
              Icons.arrow_left,
              size: 50,
            ),
          ),
        );
        break;
      case 5:
        return Container(
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              this.widget.directionHandler('right');
            },
            child: Icon(
              Icons.arrow_right,
              size: 50,
            ),
          ),
        );
        break;
      case 7:
        return Container(
          child: FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              this.widget.directionHandler('down');
            },
            child: Icon(
              Icons.arrow_drop_down,
              size: 50,
            ),
          ),
        );
        break;
      default:
        return Container();
        break;
    }
  }
}
