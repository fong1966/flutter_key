import 'package:flutter/material.dart';

import 'char_generator.dart';
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
  // Stateful tiles now wrapped in padding (a stateless widget) to increase height
  // of widget tree and show why keys are needed at the Padding level.
  late UniqueKey ukey1;
  late UniqueKey ukey2;
  List<Widget> tiles = [];

  @override
  void initState() {
    super.initState();
    ukey1 = UniqueKey();
    ukey2 = UniqueKey();
    tiles = [
      const StatefulColorfulTile1(
          // key: ukey1,
          ),
      const StatefulColorfulTile2(
          // key: ukey2,
          )
    ];
  }

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

class StatefulColorfulTile1 extends StatefulWidget {
  const StatefulColorfulTile1({super.key});

  @override
  State<StatefulColorfulTile1> createState() => ColorfulTileState1();
}

class ColorfulTileState1 extends State<StatefulColorfulTile1> {
  late Color myColor;
  late String myChar;

  @override
  void initState() {
    super.initState();
    myColor = UniqueColorGenerator.getColor();
    myChar = UniqueCharGenerator.getChar();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('$myColor & $myChar');
    return Container(
        color: myColor,
        child: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Text(myChar),
        ));
  }
}

class StatefulColorfulTile2 extends StatefulWidget {
  const StatefulColorfulTile2({super.key});

  @override
  State<StatefulColorfulTile2> createState() => ColorfulTileState2();
}

class ColorfulTileState2 extends State<StatefulColorfulTile2> {
  late Color myColor;
  late String myChar;

  @override
  void initState() {
    super.initState();
    myColor = UniqueColorGenerator.getColor();
    myChar = UniqueCharGenerator.getChar();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('$myColor & $myChar');
    return Container(
        color: myColor,
        child: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Text(myChar),
        ));
  }
}
