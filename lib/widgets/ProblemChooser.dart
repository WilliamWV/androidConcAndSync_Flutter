import 'package:flutter/material.dart';
import 'package:androidconcurrency/constants.dart';

class ProblemChooser extends StatefulWidget {
  ProblemChooser({Key key}) : super(key: key);

  @override
  ProblemChooserState createState() => new ProblemChooserState();

}

class ProblemChooserState extends State<ProblemChooser> {

  List<DropdownMenuItem<String>> _menuItems;
  String _selectedProblem;
  String get selectedProblem => _selectedProblem;

  @override
  void initState() {
    _menuItems = getDropDownMenuItems();
    _selectedProblem = _menuItems[0].value;
    super.initState();

  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for(String problem in PROBLEMS)
    items.add(new DropdownMenuItem(
        value: problem,
        child: new Text(problem)
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
              LABEL_CHOOSE_PROBLEM,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: LABEL_FONT_SIZE),
          ),
          new Container(
            padding: new EdgeInsets.all(SMALL_PADDING),
          ),
          new Container(
            padding: new EdgeInsets.only(left: MID_PADDING),
            child: new DropdownButton(
              value: _selectedProblem,
              items: _menuItems,
              onChanged: changedProblem,
            )
          )
        ],
      )
    );
  }
  void changedProblem(String selected){
    setState(() {
      _selectedProblem = selected;
    });
  }


}