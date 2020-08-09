import 'package:flutter/material.dart';
import 'package:tic_tac/button.dart';
import 'package:tic_tac/customButton.dart';

class GameScreen extends StatefulWidget {
  final player1,player2,player1Color,player2Color;
  GameScreen({this.player1,this.player2,this.player1Color,this.player2Color});
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  List<Btn> buttons;
  var active;
  List p1=[],p2=[];
  Color p1Color,p2Color;

  @override
  void initState() {
    super.initState();
    getColor();
    buttons=getButtons();
  }

  getColor(){
    switch (widget.player1Color) {
      case "Red": p1Color=Colors.red;   break;
      case "Black": p1Color=Colors.black;   break;
      case "Pink": p1Color=Colors.pink;   break;
      case "Green": p1Color=Colors.green;   break;
      case "Blue": p1Color=Colors.blue;   break;
      default:
    }
    switch (widget.player2Color) {
      case "Red": p2Color=Colors.red;   break;
      case "Black": p2Color=Colors.black;   break;
      case "Pink": p2Color=Colors.pink;   break;
      case "Green": p2Color=Colors.green;   break;
      case "Blue": p2Color=Colors.blue;   break;
      default:
    }

    setState(() {});
  }

 List<Btn> getButtons(){
    setState(() {
      p1=[]; p2=[];
      active=1;
      buttons=<Btn>[
        Btn(id: 1),Btn(id: 2),Btn(id: 3),Btn(id: 4),Btn(id: 5),Btn(id: 6),Btn(id: 7),Btn(id: 8),Btn(id: 9)
      ];
    });
    return buttons;
  }

  tapButton(Btn button){
    setState(() {
      if(active==1){
      active=2;
      button.bgColor=p1Color;
      button.text="0";
      p1.add(button.id);
    }
    else {
      active=1;
      button.bgColor=p2Color;
      button.text="X";
      p2.add(button.id);
    }
    button.enabled=false;
    int winner=result();
    if(winner==0){
      if(buttons.every((element) => element.text!="")){
        alert("Game Tied","Press Yes to play again");
      }
    }
    else if(winner==1){
      alert(widget.player1+" won","Press Yes to play again");
    }
    else if(winner==2){
      alert(widget.player2+" won","Press again to play again");
    }
    });
  }

  result(){
    int winner=0;
    if((p1.contains(1) && p1.contains(2) && p1.contains(3)) ||
       (p1.contains(4) && p1.contains(5) && p1.contains(6)) ||
       (p1.contains(7) && p1.contains(8) && p1.contains(9)) ||
       (p1.contains(1) && p1.contains(5) && p1.contains(9)) ||
       (p1.contains(3) && p1.contains(5) && p1.contains(7)) ||
       (p1.contains(1) && p1.contains(4) && p1.contains(7)) ||
       (p1.contains(2) && p1.contains(5) && p1.contains(8)) ||
       (p1.contains(3) && p1.contains(6) && p1.contains(9))
       ){
      winner=1;
    }
    if((p2.contains(1) && p2.contains(2) && p2.contains(3)) ||
       (p2.contains(4) && p2.contains(5) && p2.contains(6)) ||
       (p2.contains(7) && p2.contains(8) && p2.contains(9)) ||
       (p2.contains(1) && p2.contains(5) && p2.contains(9)) ||
       (p2.contains(3) && p2.contains(5) && p2.contains(7)) ||
       (p2.contains(1) && p2.contains(4) && p2.contains(7)) ||
       (p2.contains(2) && p2.contains(5) && p2.contains(8)) ||
       (p2.contains(3) && p2.contains(6) && p2.contains(9))
       ){
      winner=2;
    }
    return winner;
  }


  alert(String name,String content){
    showDialog(context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(name),
        content: Text(content),
        actions: <Widget>[
        FlatButton(child: Text("Yes"),
        onPressed: () { 
          Navigator.pop(context);
          setState(() {
          buttons = getButtons();
          });
          }
        ),
      ],
      );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/ttt.png",),
        title:Text("Tic Tac Toe"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: ()=>Navigator.pop(context))
        ],
      ),
      backgroundColor: Colors.lightBlue[100],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget>[
            Expanded(
                child: GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0
                    ),
                itemBuilder: (context,int index){
                  return SizedBox(
                    width: 50,
                    height: 50,
                    child: MaterialButton(
                      onPressed: buttons[index].enabled? ()=>tapButton(buttons[index]):null,
                      child: new Text(
                            buttons[index].text,textScaleFactor: 4,
                            style: new TextStyle(
                                color: Colors.white,
                            ),
                          ),
                          color: buttons[index].bgColor,
                          disabledColor: buttons[index].bgColor,
                    ),
                  );
                },
                itemCount: buttons.length,
                ),
            ),

            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.black,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("(0) "+"Player 1: "+widget.player1,textScaleFactor: 2,style: TextStyle(
                      color:Colors.white,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic
                    ),),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.black,child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("(X) "+"Player 2: "+widget.player2,textScaleFactor: 2,style: TextStyle(
                      color:Colors.white,fontWeight:FontWeight.bold,fontStyle: FontStyle.italic
                    ),),
                  )),
                ),
              ],
            ),
            
            CustomButton(
              text:"Reset Game",
              callback: ()=>alert("Reset game","Press Yes to play again")
            )

          ]
        ),
      ),
    );
  }
}