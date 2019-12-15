import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:secure_personal_finance/config/config.dart';
import 'package:secure_personal_finance/model/notes_view_model/notes_list_item_model.dart';
import 'package:secure_personal_finance/store/control_state.dart';

class NotesBodyComponent extends StatefulWidget {
  final int index;

  NotesBodyComponent(this.index, {Key key}) : super(key: key);

  @override
  _NotesBodyComponentState createState() => _NotesBodyComponentState();
}

class _NotesBodyComponentState extends State<NotesBodyComponent> {
  bool _delete = false;

  @override
  void initState() {
    super.initState();
  }

  Future _addItem() async {
    ControlState.getNotesViewState.addListItem(NotesListItemModel(ControlState.getNotesViewState.grid[widget.index].id, "", 0));
  }

  Future<void> _deleteDialog() async {
    this._delete = true;
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ControlState.getNotesViewState.grid[widget.index].getColor().withOpacity(0.05),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Hero(
                transitionOnUserGestures: true,
                tag: '${ControlState.getNotesViewState.grid[widget.index].id}-img',
                child: Image.asset(
                  ControlState.getNotesViewState.grid[widget.index].image,
                  height: 180,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                color: ControlState.getNotesViewState.grid[widget.index].getColor(),
                height: 45,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: defaultPadding),
                        child: Text(ControlState.getNotesViewState.grid[widget.index].text, style: Theme.of(context).textTheme.title),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 5,
                      child: IconButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: () => _deleteDialog(),
                        icon: Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Observer(
                  builder: (_) => ListView.builder(
                    padding: EdgeInsets.all(defaultPadding),
                    itemCount: ControlState.getNotesViewState.grid[widget.index].items.length,
                    itemBuilder: (context, index) {
                      return ControlState.getNotesViewState.grid[widget.index].items[index];
                    },
                  ),
                ),
              ),
              SafeArea(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: GestureDetector(
                        onTap: () => _addItem(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).bottomAppBarColor,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add),
                              Padding(
                                padding: EdgeInsets.only(right: 6),
                                child: Text("Add Note"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          goBack(context),
        ],
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
    if (_delete) {
      ControlState.getNotesViewState.deleteGridItem(ControlState.getNotesViewState.grid[widget.index]);
    }
  }
}
