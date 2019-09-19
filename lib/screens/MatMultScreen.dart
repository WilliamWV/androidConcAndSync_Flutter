

import 'package:androidconcurrency/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MatMultScreen extends StatefulWidget{
  MatMultScreen({Key key}): super(key: key);

  @override
  _MatMultState createState() => _MatMultState();

}

class _MatMultState extends State<MatMultScreen>{

  int _reportTime;
  String _reportTimeText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(MAT_MULT)
      ),
      body: Center(
        child: Container(
          padding: new EdgeInsets.all(MID_PADDING),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child:Text(
                  MAT_MULT,
                  style: TextStyle(fontSize: TITLE_FONT_SIZE),
                ),
                padding: EdgeInsets.symmetric(vertical: MID_PADDING)
              ),
              Text(
                PROBL_DESCRIPTION[MAT_MULT],
                style: TextStyle(fontSize: DESCRIPTION_FONT_SIZE)
              ),
              TextField(
                decoration: new InputDecoration(
                  labelText: "Matrix size",
                  labelStyle: TextStyle(fontSize: LABEL_FONT_SIZE)
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: new InputDecoration(
                    labelText: "Tasks to use",
                    labelStyle: TextStyle(fontSize: LABEL_FONT_SIZE)
                ),
                keyboardType: TextInputType.number,
              ),
              Container(
                alignment: Alignment(0.0, 0.0),
                padding: EdgeInsets.symmetric(vertical: LARGE_PADDING),
                child:RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text(
                      "RUN"
                  ),
                  onPressed: runMM,
                )
              ),
              Text(
                REPORT,
                style: TextStyle(fontSize: TITLE_FONT_SIZE),
              ),
              Row(
                children: <Widget>[
                  Text(
                    TIME,
                    style: TextStyle(fontSize: LABEL_FONT_SIZE),
                  ),
                  Text(
                    _reportTimeText,
                    style: TextStyle(fontSize: LABEL_FONT_SIZE),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void runMM(){

  }
}

