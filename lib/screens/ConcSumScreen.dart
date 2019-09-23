

import 'dart:math';

import 'package:androidconcurrency/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConcSumScreen extends StatefulWidget{
  ConcSumScreen({Key key}): super(key: key);

  @override
  _ConcSumState createState() => _ConcSumState();

}

class _ConcSumState extends State<ConcSumScreen>{

  int _numbers;
  int _tasks;
  int _reportTime;
  String _reportTimeText = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(CONC_SUM)
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
                    CONC_SUM,
                    style: TextStyle(fontSize: TITLE_FONT_SIZE),
                  ),
                  padding: EdgeInsets.symmetric(vertical: MID_PADDING)
              ),
              Text(
                  PROBL_DESCRIPTION[CONC_SUM],
                  style: TextStyle(fontSize: DESCRIPTION_FONT_SIZE)
              ),
              TextField(
                decoration: new InputDecoration(
                    labelText: "Numbers",
                    labelStyle: TextStyle(fontSize: LABEL_FONT_SIZE)
                ),
                keyboardType: TextInputType.number,
                onChanged: (String text){
                  this._numbers = int.parse(text);
                },
              ),
              TextField(
                decoration: new InputDecoration(
                    labelText: "Tasks to use",
                    labelStyle: TextStyle(fontSize: LABEL_FONT_SIZE)
                ),
                keyboardType: TextInputType.number,
                onChanged: (String text){
                  this._tasks = int.parse(text);
                },
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
  void runCS() async{
    Stopwatch stopwatch = new Stopwatch()..start();

    Map args = {
      ARR: randArr(this._numbers),
      S_TASKS: this._tasks,
    };

  }
}

List<int> randArr(int size){
  Random r = new Random(DateTime.now().millisecondsSinceEpoch);
  List<int> arr = [];
  for (int i = 0; i < size; i++){
    for (int j = 0; j < size; j++){
      arr.add(r.nextInt(S_MAX_VAL));
    }
  }
  return arr;
}

Future<List<int>> sumArr(Map args) async{
  return Future.value([]);
}
