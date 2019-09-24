

import 'dart:math';

import 'package:androidconcurrency/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
      body: ListView(
        children: <Widget>[
          Center(
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
        ],
      )
    );
  }
  void runCS() async{
    Stopwatch stopwatch = new Stopwatch()..start();

    Map args = {
      ARR: randArr(this._numbers),
      S_TASKS: this._tasks,
      LEVEL: 0,
      NUMBERS: this._numbers
    };

    int levels = log2(this._numbers).ceil();
    for (int level = 0; level < levels; level++) {
      args[LEVEL] = level;
      List<Future<List<int>>> levelAns = [];
      int tasksThisLevel = min(this._tasks, this._numbers/pow(2.0, 1.0 + level)).ceil();
      for (int i = 0; i < tasksThisLevel; i++){
        args[S_ID] = i;
        Future<List<int>> taskAns = compute(sumArr, args);
        levelAns.add(taskAns);
      }
      List<int> ans = [];
      for (int i = 0; i < tasksThisLevel; i++){
        await levelAns[i].then((partialArr) => {
          ans.addAll(partialArr)
        });
      }
      args[ARR] = ans;
    }
    stopwatch.stop();
    setState(() {
      _reportTime = stopwatch.elapsedMilliseconds;
      _reportTimeText = _reportTime.toString() + " ms";
    });


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
  List<int> arr = args[ARR];
  int numbers = args[NUMBERS];
  int level = args[LEVEL];
  int tasks = args[S_TASKS];
  int id = args[S_ID];
  int sums = (numbers/ pow(2.0, 1.0 + level)).ceil();
  int extraSum = 0;
  if (sums % tasks > id){
    extraSum = 1;
  }
  int taskSums = sums~/tasks + extraSum;
  int firstSumOffset = min(id, sums%tasks);
  int firstSum = id * (sums ~/ tasks) + firstSumOffset;

  List<int> ans = [];
  for (int i = firstSum; i < firstSum + taskSums; i++){
    if((numbers / pow(2, level)).ceil() > 2 * i + 1){
      ans.add(arr[2 * i] + arr[2 * i + 1]);
    }
    else {
      ans.add(arr[2 * i]);
    }

  }

  return Future.value(ans);
}

double log2(int num){
  return log(num)/log(2);
}
