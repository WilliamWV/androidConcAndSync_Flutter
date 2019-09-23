import 'package:flutter/material.dart';
import 'package:androidconcurrency/constants.dart';

class ImageChooser extends StatefulWidget {
  ImageChooser({Key key}) : super(key: key);

  @override
  ImageChooserState createState() => new ImageChooserState();

}

class ImageChooserState extends State<ImageChooser> {

  List<DropdownMenuItem<String>> _menuItems;
  String _selectedImage;
  String get selectedImage => _selectedImage;

  @override
  void initState() {
    _menuItems = getDropDownMenuItems();
    _selectedImage = _menuItems[0].value;
    super.initState();

  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for(String img in IMAGES)
      items.add(new DropdownMenuItem(
          value: img,
          child: new Text(img)
      ));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: new EdgeInsets.fromLTRB(
            MID_PADDING, LARGE_PADDING, MID_PADDING, MID_PADDING
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              LABEL_CHOOSE_IMG,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: LABEL_FONT_SIZE),
            ),
            new Container(
              padding: new EdgeInsets.all(SMALL_PADDING),
            ),
            new Container(
                padding: new EdgeInsets.only(left: MID_PADDING),
                child: new DropdownButton(
                  value: _selectedImage,
                  items: _menuItems,
                  onChanged: changedImage,
                )
            )
          ],
        )
    );
  }
  void changedImage(String selected) {
    setState(() {
      _selectedImage = selected;
    });
  }
}