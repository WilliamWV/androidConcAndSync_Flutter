import 'package:androidconcurrency/screens/ConcSumScreen.dart';
import 'package:androidconcurrency/screens/MatMultScreen.dart';
import 'package:androidconcurrency/screens/PhilosophersScreen.dart';
import 'package:androidconcurrency/screens/ProdConsScreen.dart';
import 'package:androidconcurrency/widgets/ProblemChooser.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

final pcKey = new GlobalKey<ProblemChooserState>();

class InitScreen extends StatefulWidget {
  InitScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: new EdgeInsets.all(MID_PADDING),
              child: Text(
                TITLE,
                style: TextStyle(fontSize: TITLE_FONT_SIZE),
              ),
            ),
            ProblemChooser(key: pcKey),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text(
                  "DONE"
              ),
              onPressed: pressedDone,
            )
          ],
        ),
      ),
    );
  }
  void pressedDone(){
    var problem = pcKey.currentState.selectedProblem;
    switch(problem){
      case MAT_MULT: 
        Navigator.push(context, MaterialPageRoute(builder: (context) => MatMultScreen()));
        break;
      case CONC_SUM:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ConcSumScreen()));
        break;
      case PHILOSOPHERS:
        Navigator.push(context, MaterialPageRoute(builder: (context) => PhilosophersScreen()));
        break;
      case IMG_DOWN: break;
      case PROD_CONS:
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProdConsScreen()));
        break;
    }
  }
}

