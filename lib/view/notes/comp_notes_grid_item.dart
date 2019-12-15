import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_personal_finance/store/control_state.dart';
import 'package:secure_personal_finance/view/notes/comp_notes_body.dart';

class NotesComponent extends StatefulWidget {
  final int index;

  NotesComponent(this.index, {Key key}) : super(key: key);
  _NotesComponentState createState() => _NotesComponentState();
}

class _NotesComponentState extends State<NotesComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotesBodyComponent(widget.index))),
      child: Column(
        children: <Widget>[
          Hero(
            transitionOnUserGestures: true,
            tag: '${ControlState.getNotesViewState.grid[widget.index].id}-img',
            child: Image.asset(
              ControlState.getNotesViewState.grid[widget.index].image,
              height: 174.5,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            height: 20,
            color: ControlState.getNotesViewState.grid[widget.index].getColor(),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(ControlState.getNotesViewState.grid[widget.index].text, style: Theme.of(context).textTheme.body2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
