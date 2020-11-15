import 'package:flutter/material.dart';

import 'package:memorygame/data/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void createGame() {
    pairs = getPairs();
    pairs.shuffle();

    visiblePairs = pairs;
    selected = true;
    selectedImage = "";
    selectedTileIndex = null;

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        visiblePairs = getQuestions();
        selected = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();

    createGame();
  }

  void restartGame() {
    setState(() {
      points = 0;
    });
    createGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 20,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              points != 800
                  ? Column(
                      children: [
                        Text(
                          "$points/800",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text("Points"),
                      ],
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              points != 800
                  ? GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisSpacing: 0.0,
                        maxCrossAxisExtent: 100,
                      ),
                      children: List.generate(
                        visiblePairs.length,
                        (index) => Tile(
                          imageAssetPath:
                              visiblePairs[index].getImageAssetPath(),
                          parent: this,
                          tileIndex: index,
                        ),
                      ),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: GestureDetector(
                        onTap: () => restartGame(),
                        child: Text(
                          "Replay",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
            ],
          )),
    );
  }
}

class Tile extends StatefulWidget {
  String imageAssetPath;
  int tileIndex;

  _HomePageState parent;
  Tile({
    Key key,
    this.imageAssetPath,
    this.tileIndex,
    this.parent,
  }) : super(key: key);

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected) {
          if (selectedImage != "") {
            if (selectedImage == pairs[widget.tileIndex].getImageAssetPath()) {
              print("correct");

              // Disable tap during the validation
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                points += 100;
                // Enable tap after the validation
                selected = false;

                widget.parent.setState(() {
                  pairs[widget.tileIndex].setImageAssetPath("");
                  pairs[selectedTileIndex].setImageAssetPath("");
                });
                selectedImage = "";
              });
            } else {
              print("incorrect");

              // Disable tap during the validation
              selected = true;
              Future.delayed(const Duration(seconds: 2), () {
                // Enable tap after the validation
                selected = false;

                widget.parent.setState(() {
                  pairs[widget.tileIndex].setIsSelected(false);
                  pairs[selectedTileIndex].setIsSelected(false);
                });
                selectedImage = "";
              });
            }
          } else {
            selectedTileIndex = widget.tileIndex;
            selectedImage = pairs[widget.tileIndex].getImageAssetPath();
          }
          setState(() {
            pairs[widget.tileIndex].setIsSelected(true);
          });
          print("You've clicked me");
        }
      },
      child: Container(
        margin: EdgeInsets.all(5),
        child: pairs[widget.tileIndex].getImageAssetPath() != ""
            ? Image.asset(
                pairs[widget.tileIndex].getIsSelected()
                    ? pairs[widget.tileIndex].getImageAssetPath()
                    : widget.imageAssetPath,
              )
            : Image.asset("assets/correct.png"),
      ),
    );
  }
}
