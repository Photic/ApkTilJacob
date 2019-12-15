// Flutter
import 'package:flutter/material.dart';
import 'package:secure_personal_finance/config/config.dart';
import 'package:secure_personal_finance/store/control_state.dart';
import 'package:secure_personal_finance/view/notes/comp_add_grid_item.dart';
import 'package:secure_personal_finance/view/notes/comp_notes_grid.dart';

class NotesList extends StatefulWidget {
  NotesList({Key key}) : super(key: key);
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  void initState() {
    ControlState.getNotesViewState.updateState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Column(
            // ! MainGrid
            children: <Widget>[
              NotesGridComp()
            ],
          ),
          Positioned(
            bottom: defaultPadding,
            right: defaultPadding,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(opaque: false, transitionDuration: Duration(microseconds: 0), pageBuilder: (BuildContext context, _, __) => NotesAddGridItemComp()));
              },
              child: Icon(Icons.add),
              heroTag: keyAddGrid,
            ),
          ),
        ],
      ),
    );
  }
}
