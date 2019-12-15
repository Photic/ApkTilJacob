import 'package:flutter/material.dart';
import 'package:secure_personal_finance/model/notes_view_model/notes_grid_model.dart';
import 'package:secure_personal_finance/store/control_state.dart';
import 'package:secure_personal_finance/view-generic/view_pick_contact.dart';

class NotesAddGridItemComp extends StatefulWidget {
  const NotesAddGridItemComp({Key key}) : super(key: key);

  @override
  _NotesAddGridItemCompState createState() => _NotesAddGridItemCompState();
}

class _NotesAddGridItemCompState extends State<NotesAddGridItemComp> {
  String _title = "";
  String _color = Colors.red.toString();

  List<CustomButtonData> buttons = [
    CustomButtonData(Colors.red, true),
    CustomButtonData(Colors.green, false),
    CustomButtonData(Colors.blue, false),
    CustomButtonData(Colors.orange, false),
    CustomButtonData(Colors.pink[300], false),
  ];

  Future<void> _shareList() async {
    Navigator.of(context).push(PageRouteBuilder(opaque: false, transitionDuration: Duration(microseconds: 0), pageBuilder: (BuildContext context, _, __) => PickContact()));
  }

  Future<void> _addGridItem() async {
    await ControlState.getNotesViewState.addGridItem(NotesGridModel(_title, "", _color));
    Navigator.of(context).pop(true);
  }

  List<Widget> _getColoredButtons() {
    List<Widget> tempButtons = List<Widget>();

    this.buttons.forEach((customButton) {
      tempButtons.add(
        Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(height: 37, width: 37, decoration: customButton.boolean ? BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)) : BoxDecoration()),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 35,
                  height: 35,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: customButton.color,
                    onPressed: () {
                      setState(() {
                        buttons.forEach((button) {
                          button.boolean = false;
                        });
                        customButton.boolean = !customButton.boolean;
                      });
                      this._color = customButton.color.toString();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
    return tempButtons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(true);
              },
              child: Container(
                color: Colors.black.withOpacity(0.85),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).bottomAppBarColor.withOpacity(0.85),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  height: 350,
                  width: 300,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              color: Colors.red,
                              child: Text("Dismiss"),
                            ),
                            RaisedButton(
                              onPressed: () {
                                this._addGridItem();
                              },
                              color: Colors.green,
                              child: Text("Accept"),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 80),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TextField(
                                maxLength: 20,
                                decoration: InputDecoration(labelText: "Title"),
                                onChanged: (text) {
                                  this._title = text;
                                },
                              ),
                              Text("Pick a picture -> Not Working"),
                              RaisedButton(
                                onPressed: () => _shareList(),
                                child: Text("Share Note -> Not Working"),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: _getColoredButtons(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonData {
  Color color;
  bool boolean;
  CustomButtonData(this.color, this.boolean);
}
