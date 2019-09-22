
import 'dart:developer';

import 'package:androidconcurrency/constants.dart';
import 'package:androidconcurrency/screens/MatMultScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  mm_test();
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
      TASKS: 1,
      ID: 0
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
      TASKS: 2,
      ID: 0
    };

    List<List<int>> actual = [];
    Future<List<List<int>>> futureResult1 = matMult(args);

    args[ID] = 1;

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