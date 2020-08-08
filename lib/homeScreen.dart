import 'package:flutter/material.dart';
import 'package:tic_tac/customButton.dart';
import 'package:tic_tac/gameScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var player1,player2;

  navigate(){
    return Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(player1: player1,player2: player2,),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.15)),
              Image.asset("assets/ttt.png",width: 200,height: 200,),
              Center(child: Text("Tic Tac Toe",textScaleFactor: 3,style: TextStyle(fontWeight:FontWeight.bold,fontStyle: FontStyle.italic),)),
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

              CustomButton(
                text:"Play",
                callback: navigate
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child:Text("Built by @TS❤️",textAlign: TextAlign.center, style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
       // color:Colors.grey
      ),
    );
  }
}