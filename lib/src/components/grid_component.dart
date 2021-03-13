import 'package:flutter/material.dart';

class GridComponent extends StatefulWidget {
  final List gridInfo;

  GridComponent({this.gridInfo});

  @override
  State<StatefulWidget> createState() => _GridState();
}

class _GridState extends State<GridComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(
              9, (index) => gridContainer(this.widget.gridInfo, index))),
    );
  }
}

gridContainer(List coords, int index) {
  int arrayPosition = coords[1] * 3 + coords[0];
  if (index == arrayPosition) {
    return Container(
      decoration: locatedBoxDecoration(),
      child: Icon(
        Icons.adb,
        size: 100,
      ),
    );
  } else {
    return Container(
      decoration: gridBoxDecoration(),
    );
  }
}

BoxDecoration gridBoxDecoration() {
  return BoxDecoration(
      border: Border.all(width: 1),
      gradient: LinearGradient(
        colors: [
          const Color(0xFF64DD17),
          const Color(0xFF76FF03),
          const Color(0xFFCCFF90),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ));
}

// Pintar caja donde estara el carrito (Porfa Anahi)
BoxDecoration locatedBoxDecoration() {
  return BoxDecoration(
      border: Border.all(width: 1),
      gradient: LinearGradient(
        colors: [const Color(0xFF33691E), const Color(0xFF558B2F)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ));
}
