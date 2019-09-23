

import 'package:androidconcurrency/constants.dart';
import 'package:androidconcurrency/widgets/ImageChooser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final imgKey = new GlobalKey<ImageChooserState>();

class ImgDownScreen extends StatefulWidget{
  ImgDownScreen({Key key}): super(key: key);

  @override
  _ImgDownState createState() => _ImgDownState();

}

class _ImgDownState extends State<ImgDownScreen>{

  int _reportTime;
  String _reportTimeText = "";
  Widget _image = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(IMG_DOWN)
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
                        IMG_DOWN,
                        style: TextStyle(fontSize: TITLE_FONT_SIZE),
                      ),
                      padding: EdgeInsets.symmetric(vertical: MID_PADDING)
                  ),
                  Text(
                      PROBL_DESCRIPTION[IMG_DOWN],
                      style: TextStyle(fontSize: DESCRIPTION_FONT_SIZE)
                  ),
                  ImageChooser(key: imgKey),
                  Container(
                      alignment: Alignment(0.0, 0.0),
                      padding: EdgeInsets.only(bottom: MID_PADDING),
                      child:RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text(
                            "RUN"
                        ),
                        onPressed: runID,
                      )
                  ),
                  this._image,
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
  void runID(){
    imageCache.clear();
    var image = imgKey.currentState.selectedImage;
    Stopwatch stopwatch = new Stopwatch()..start();
    setState(() {
      Image img = new Image.network(IMG_URL[image]);
      img.image.resolve(new ImageConfiguration()).addListener(ImageStreamListener((_, __) => {
        if (mounted) {
          this.updateTime(stopwatch..stop())
        }
      }));
      this._image = img;
    });

  }
  void updateTime(Stopwatch s){
    setState((){
      _reportTime = s.elapsedMilliseconds;
      _reportTimeText = _reportTime.toString() + " ms";
    });
  }
}

