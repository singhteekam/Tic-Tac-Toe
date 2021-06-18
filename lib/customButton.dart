import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final text;
  final VoidCallback callback;
  CustomButton({this.text,required this.callback});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.teal,
        elevation: 6.0,
        borderRadius: BorderRadius.circular(10.0),
        child: MaterialButton(
          onPressed: callback,
          minWidth: 100.0,
          height: 45.0,
          child: Text(text,textScaleFactor: 1.7,style: TextStyle(color:Colors.white),),
        ),
      );
  }
}