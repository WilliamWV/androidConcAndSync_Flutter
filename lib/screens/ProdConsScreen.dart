

import 'package:androidconcurrency/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProdConsScreen extends StatefulWidget{
  ProdConsScreen({Key key}): super(key: key);

  @override
  _ProdConsState createState() => _ProdConsState();

}

class _ProdConsState extends State<ProdConsScreen>{

  double _reportProd;
  double _reportCons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(PROD_CONS)
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
                    PROD_CONS,
                    style: TextStyle(fontSize: TITLE_FONT_SIZE),
                  ),
                  padding: EdgeInsets.symmetric(vertical: MID_PADDING)
              ),
              Text(
                  PROBL_DESCRIPTION[PROD_CONS],
                  style: TextStyle(fontSize: DESCRIPTION_FONT_SIZE)
              ),
              TextField(
                decoration: new InputDecoration(
                    labelText: "Producers",
                    labelStyle: TextStyle(fontSize: LABEL_FONT_SIZE)
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: new InputDecoration(
                    labelText: "Consumers",
                    labelStyle: TextStyle(fontSize: LABEL_FONT_SIZE)
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: new InputDecoration(
                    labelText: "Buffer size",
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
                      PROD_ITEMS,
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
                        CONS_ITEMS,
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

