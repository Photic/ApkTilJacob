import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:secure_personal_finance/config/config.dart';
import 'package:secure_personal_finance/store/control_state.dart';
import 'package:secure_personal_finance/view/notes/comp_notes_grid_item.dart';

class NotesGridComp extends StatefulWidget {
  const NotesGridComp({Key key}) : super(key: key);

  @override
  _NotesGridCompState createState() => _NotesGridCompState();
}

class _NotesGridCompState extends State<NotesGridComp> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  Future refreshGrid() async {
    ControlState.getNotesViewState.updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        key: refreshKey,
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Observer(
            builder: (_) => GridView.builder(
              itemCount: ControlState.getNotesViewState.grid.length,
              itemBuilder: (context, index) {
                return NotesComponent(index);
              },
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: defaultPadding, crossAxisSpacing: defaultPadding),
            ),
          ),
        ),
        onRefresh: () => refreshGrid(),
      ),
    );
  }

  Widget emptyGrid() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Create a new list"),
        ],
      ),
    );
  }
}
