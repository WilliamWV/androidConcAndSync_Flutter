
import 'dart:developer';
import 'dart:math';

import 'package:androidconcurrency/constants.dart';
import 'package:androidconcurrency/screens/ConcSumScreen.dart';
import 'package:androidconcurrency/screens/MatMultScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  mm_test();
  sum_test();
}

void mm_test(){

  List<List<int>> m1 = [
    [1, 5, 6],
    [7, 9, 2],
    [3, 6, 0]
  ];

  List<List<int>> m2 = [
    [4, 8, 1],
    [2, 7, 3],
    [9, 5, 6]
  ];

  List<List<int>> expected = [
    [68, 73, 52],
    [64, 129, 46],
    [24, 66, 21]
  ];

  test('Matrix multiplication - single task', () async {
    Map args = {
      M1: m1,
      M2: m2,
      MM_TASKS: 1,
      MM_ID: 0
    };

    List<List<int>> actual = [];
    Future<List<List<int>>> futureResult = matMult(args);
    await futureResult.then((result) => {
      actual = result
    });
    //Future.wait([futureResult]);
    
    expect(actual, expected);
  });

  test('Matrix multiplication - multi task', () async{
    Map args = {
      M1: m1,
      M2: m2,
      MM_TASKS: 2,
      MM_ID: 0
    };

    List<List<int>> actual = [];
    Future<List<List<int>>> futureResult1 = matMult(args);

    args[MM_ID] = 1;

    Future<List<List<int>>> futureResult2 = matMult(args);
    
    await futureResult1.then((result) => {
      actual.addAll(result)
    });
    await futureResult2.then((result) => {
      actual.addAll(result)
    });
    
    expect(actual, expected);
  });
}

void sum_test(){
  List<int> arr = [2, 6, 9, 12, 4, 13, 5];
  int expected = 51;

  test('Concurrent sum - single task', () async{
    Map args = {
      ARR: arr,
      S_TASKS: 1,
      NUMBERS: 7
    };
    int levels = log2(arr.length).ceil();
    for (int level = 0; level < levels; level++) {
      args[LEVEL] = level;
      args[S_ID] = 0;
      Future<List<int>> taskAns = sumArr(args);

      List<int> ans = [];
      await taskAns.then((partialArr) => {
        ans.addAll(partialArr)
      });

      args[ARR] = ans;
    }
    expect(args[ARR][0], expected);
  });

  test('Concurrent sum - multi task', () async{
    Map args = {
      ARR: arr,
      S_TASKS: 2,
      NUMBERS: 7
    };
    int levels = log2(arr.length).ceil();
    for (int level = 0; level < levels; level++) {
      args[LEVEL] = level;
      List<Future<List<int>>> levelAns = [];
      int tasksThisLevel = min(2, 7.0/pow(2.0, 1.0 + level)).ceil();
      for (int i = 0; i < tasksThisLevel; i++){
        args[S_ID] = i;
        Future<List<int>> taskAns = sumArr(args);
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
    expect(args[ARR][0], expected);
  });
}