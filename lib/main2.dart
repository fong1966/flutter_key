import 'dart:math';

import 'package:flutter/material.dart';

import 'color_generator.dart';

void main() => runApp(
      const MaterialApp(
        home: PositionedTiles(),
      ),
    );

class PositionedTiles extends StatefulWidget {
  const PositionedTiles({super.key});

  @override
  State<StatefulWidget> createState() => PositionedTilesState();
}

class PositionedTilesState extends State<PositionedTiles> {
  List<Widget> tiles = [
    StatelessColorfulTile(),
    StatelessColorfulTile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.sentiment_very_satisfied),
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorfulTile extends StatelessWidget {
  StatelessColorfulTile({super.key});

  final Color myColor = UniqueColorGenerator.getColor();
  @override
  Widget build(BuildContext context) {
    // debugPrint('$myColor');
    return Container(
      color: myColor,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({super.key});

  @override
  State<StatefulColorfulTile> createState() => StatefulColorfulTileState();
}

class StatefulColorfulTileState extends State<StatefulColorfulTile> {
  late Color myColor;

  @override
  void initState() {
    super.initState();
    myColor = UniqueColorGenerator.getColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: myColor,
        child: const Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}
