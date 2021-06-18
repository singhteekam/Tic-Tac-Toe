import 'package:flutter/material.dart';
import 'package:zero_cross/settings.dart';
import 'package:zero_cross/customButton.dart';
import 'package:zero_cross/gameScreen.dart';
// import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var player1 = "Player 1", player2 = "Player 2";
  String player1Color = "Red", player2Color = "Black";
  List<DropdownMenuItem<String>> items = [];
  List<String> chooseColors = ["Red", "Black", "Pink", "Green", "Blue"];


  @override
  initState() {
    super.initState();
    getColorOpt();
  }

  getColorOpt() {
    for (int i = 0; i < chooseColors.length; i++) {
      items.add(
        new DropdownMenuItem(
            child: new Text(chooseColors[i]), value: chooseColors[i]),
      );
    }
    setState(() {});
  }

  navigate() {
    return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameScreen(
            player1: player1,
            player2: player2,
            player1Color: player1Color,
            player2Color: player2Color,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlue[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15)),

              Center(
                child: Container(
                  // margin: EdgeInsets.all(20),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Color(0xFF00EAD9), width: 3),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/ttt.png"), fit: BoxFit.fill),
                  ),
                ),
              ),

              Center(
                  child: Text(
                "Zero Cross",
                textScaleFactor: 2.5,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) => player1 = value,
                  decoration: InputDecoration(
                    labelText: "Player 1",
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) => player2 = value,
                  decoration: InputDecoration(
                    labelText: "Player 2",
                    border: const OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Center(
                    child: Text(
                  "Choose Color",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, bottom: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Player 1:",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Container(
                        child: DropdownButton(
                      value: player1Color,
                      items: items,
                      onChanged: (String? value) {
                        setState(() {
                          player1Color = value!;
                        });
                      },
                    )),
                    Text("Player 2:",
                        textScaleFactor: 1.2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Container(
                        child: DropdownButton(
                      value: player2Color,
                      items: items,
                      onChanged: (String? value) {
                        setState(() {
                          player2Color = value!;
                        });
                      },
                    )),
                  ],
                ),
              ),

             

              CustomButton(text: "Play", callback: navigate),

              SizedBox(height: 20),

              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings())),
                child: Container(
                    height: 40,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.settings), Text(" Settings")])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
