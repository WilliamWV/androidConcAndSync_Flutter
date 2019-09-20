

import 'dart:developer' as prefix0;

import 'package:androidconcurrency/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MatMultScreen extends StatefulWidget{
  MatMultScreen({Key key}): super(key: key);

  @override
  _MatMultState createState() => _MatMultState();

}

class _MatMultState extends State<MatMultScreen>{

  int _reportTime;
  int _matrixSize;
  int _tasks;
  String _reportTimeText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(MAT_MULT)
      ),
      body: ListView(
        children: <Widget> [
          Center(
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
                    onChanged: (String text){
                      this._matrixSize = int.parse(text);
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
        ]
      )
    );
  }
  void runMM() async {
    prefix0.log("Time: " + this._reportTime.toString());
    Stopwatch stopwatch = new Stopwatch()..start();

    Map args = {
      M1 : randMat(this._matrixSize),
      M2 : randMat(this._matrixSize),
      TASKS : this._tasks
    };
    List<List<int>> answer = [];
    for (int i = 0; i < this._tasks; i++){
      args[ID] = i;
      List<List<int>> temp = await compute(matMult, args);
      answer.addAll(temp);
    }
    stopwatch.stop();
    setState((){
      _reportTime = stopwatch.elapsedMilliseconds;
      _reportTimeText = _reportTime.toString() + " ms";
    });
    prefix0.log("Time: " + this._reportTime.toString());
    prefix0.log("Time text: " + this._reportTimeText);
  }
}

List<List<int>> randMat(int size){

  Random r = new Random(DateTime.now().millisecondsSinceEpoch);
  List<List<int>> mat = [];
  for (int i = 0; i < size; i++){
    mat.add([]);
    for (int j = 0; j < size; j++){
      mat[i].add(r.nextInt(MAX_VAL));
    }
  }
  return mat;
}

List<List<int>> matMult(Map args){
  List<List<int>> m1 = args[M1];
  List<List<int>> m2 = args[M2];
  int id = args[ID];
  int tasks = args[TASKS];
  int size = m1.length;

  List<List<int>> ans = [];

  int extraLine = 0;
  if (size%tasks > id) extraLine = 1;

  int lines = size ~/ tasks + extraLine;
  int firstLineOffset = min(id, size%tasks);
  int firstLine = id * (size~/tasks) + firstLineOffset;

  for(int i = firstLine; i < firstLine + lines; i++){
    ans.add([]);
    for (int j = 0; j < size; j++){
      int sum = 0;
      for (int k = 0; k < size; k++){
        sum += m1[i][k] * m2[k][j];
      }
      ans[i - firstLine].add(sum);
    }
  }
  return ans;
}



