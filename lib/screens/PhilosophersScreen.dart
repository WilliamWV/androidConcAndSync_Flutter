

import 'package:androidconcurrency/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhilosophersScreen extends StatefulWidget{
  PhilosophersScreen({Key key}): super(key: key);

  @override
  _PhilosophersState createState() => _PhilosophersState();

}

class _PhilosophersState extends State<PhilosophersScreen>{

  double _reportAvg;
  double _reportDev;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(PHILOSOPHERS)
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
                    PHILOSOPHERS,
                    style: TextStyle(fontSize: TITLE_FONT_SIZE),
                  ),
                  padding: EdgeInsets.symmetric(vertical: MID_PADDING)
              ),
              Text(
                  PROBL_DESCRIPTION[PHILOSOPHERS],
                  style: TextStyle(fontSize: DESCRIPTION_FONT_SIZE)
              ),
              TextField(
                decoration: new InputDecoration(
                    labelText: "Philosophers",
                    labelStyle: TextStyle(fontSize: LABEL_FONT_SIZE)
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: new InputDecoration(
                    labelText: "Time to run",
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
                    onPressed: runCS,
                  )
              ),
              Container(
                padding: EdgeInsets.only(bottom: MID_PADDING),
                child:Text(
                  REPORT,
                  style: TextStyle(fontSize: TITLE_FONT_SIZE),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: SMALL_PADDING),
                child:Row(
                  children: <Widget>[
                    Text(
                      AVERAGE,
                      style: TextStyle(fontSize: LABEL_FONT_SIZE),
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: LABEL_FONT_SIZE),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: SMALL_PADDING),
                child:Row(
                  children: <Widget>[
                    Text(
                      DEVIATION,
                      style: TextStyle(fontSize: LABEL_FONT_SIZE),
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: LABEL_FONT_SIZE),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
  void runCS(){

  }
}

