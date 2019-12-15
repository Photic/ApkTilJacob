import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:secure_personal_finance/control/control_reg.dart';
import 'package:secure_personal_finance/store/control_state.dart';

part 'notes_list_item_model.g.dart';

@JsonSerializable()
class NotesListItemModel extends StatefulWidget {
  final int id;
  final String text;
  final int radio;
  final int primaryKey;

  NotesListItemModel(this.id, this.text, this.radio, [this.primaryKey]);

  /// Construct [object] from JSON
  factory NotesListItemModel.fromJson(Map<String, dynamic> json) => _$NotesListItemModelFromJson(json);

  /// Returns [object] to JSON.
  Map<String, dynamic> toJson() => _$NotesListItemModelToJson(this);

  @override
  _NotesListItemModelState createState() => _NotesListItemModelState();
}

class _NotesListItemModelState extends State<NotesListItemModel> {
  TextEditingController txt = TextEditingController();

  bool _radioBool;
  String newText;
  int radio;

  void _saveChange() async {
    if (_radioBool) {
      this.radio = 1;
    } else {
      this.radio = 0;
    }

    await ControlState.getNotesViewState.updateListItem(NotesListItemModel(widget.id, this.newText, this.radio, widget.primaryKey));
  }

  void _removeME() async {
    await ControlState.getNotesViewState.deleteListItem(widget);
  }

  @override
  void initState() {
    if (widget.radio == 1)
      _radioBool = true;
    else {
      _radioBool = false;
    }
    newText = widget.text;
    super.initState();
    txt.text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: _radioBool,
        onChanged: (bool value) {
          setState(() {
            _radioBool = value;
          });
          _saveChange();
        },
      ),
      title: TextField(
        controller: this.txt,
        decoration: InputDecoration.collapsed(hintText: ""),
        textInputAction: TextInputAction.done,
        style: Theme.of(context).textTheme.body2,
        onChanged: (text) {
          newText = text;
        },
        onEditingComplete: () {
          _saveChange();
        },
      ),
      trailing: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () => _removeME(),
        icon: Icon(Icons.remove),
      ),
    );
  }

  @override
  void dispose() {
    _saveChange();
    super.dispose();
  }
}
