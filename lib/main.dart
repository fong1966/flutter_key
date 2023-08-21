import 'package:flutter/material.dart';

import 'main2.dart';

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
  List<Widget> tiles = [
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: const StatefulColorfulTile(),
      // child: StatefulColorfulTile(key: UniqueKey()), // <------
    ),
    Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: const StatefulColorfulTile(),
      // child: StatefulColorfulTile(key: UniqueKey()), // <------
    ),
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

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({Key? key}) : super(key: key);

  @override
  State<StatefulColorfulTile> createState() => ColorfulTileState();
}

class ColorfulTileState extends State<StatefulColorfulTile> {
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
