

import 'package:androidconcurrency/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImgDownScreen extends StatefulWidget{
  ImgDownScreen({Key key}): super(key: key);

  @override
  _ImgDownState createState() => _ImgDownState();

}

class _ImgDownState extends State<ImgDownScreen>{

  int _reportTime;
  String _reportTimeText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(IMG_DOWN)
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
                    IMG_DOWN,
                    style: TextStyle(fontSize: TITLE_FONT_SIZE),
                  ),
                  padding: EdgeInsets.symmetric(vertical: MID_PADDING)
              ),
              Text(
                  PROBL_DESCRIPTION[IMG_DOWN],
                  style: TextStyle(fontSize: DESCRIPTION_FONT_SIZE)
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
                    onPressed: runID,
                  )
              ),
              imageDisplayer(),
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
  void runID(){

  }
  Widget imageDisplayer(){
    return Container();
  }
}

