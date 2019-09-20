
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

  test('Matrix multiplication - single task', (){
    Map args = {
      M1: m1,
      M2: m2,
      TASKS: 1,
      ID: 0
    };

    List<List<int>> actual = matMult(args);
    expect(actual, expected);
  });

  test('Matrix multiplication - multi task', (){
    Map args = {
      M1: m1,
      M2: m2,
      TASKS: 2,
      ID: 0
    };

    List<List<int>> actual = matMult(args);

    args[ID] = 1;

    List<List<int>> s2 = matMult(args);
    actual.addAll(s2);

    expect(actual, expected);
  });
}