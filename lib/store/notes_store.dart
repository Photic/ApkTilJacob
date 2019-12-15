import 'package:mobx/mobx.dart';
import 'package:secure_personal_finance/control/control_reg.dart';
import 'package:secure_personal_finance/model/notes_view_model/notes_grid_model.dart';
import 'package:secure_personal_finance/model/notes_view_model/notes_list_item_model.dart';

part 'notes_store.g.dart';

class NotesStore = Notes with _$NotesStore;

abstract class Notes with Store {
  @observable
  ObservableList<NotesGridModel> grid = ObservableList<NotesGridModel>();

  @action
  Future<void> updateState() async {
    final db = await ControlReg.getSQLControl.database;
    final sql = '''SELECT * FROM ${ControlReg.getSQLControl.notesGridItemTable};''';
    final data = await db.rawQuery(sql);
    ObservableList<NotesGridModel> dbGrid = ObservableList<NotesGridModel>();

    for (final item in data) {
      final grid = NotesGridModel.fromJson(item);
      final sql2 = '''SELECT * FROM ${ControlReg.getSQLControl.notesListItemTable} WHERE id = ${grid.id};''';
      final data = await db.rawQuery(sql2);
      List<NotesListItemModel> items = List<NotesListItemModel>();

      for (final listItem in data) {
        final item = NotesListItemModel.fromJson(listItem);
        items.add(item);
      }

      grid.items = items;

      dbGrid.add(grid);
    }

    this.grid = dbGrid;
  }

  Future<void> addGridItem(NotesGridModel noteGrid) async {
    final sql = '''INSERT INTO ${ControlReg.getSQLControl.notesGridItemTable}
    (
      ${ControlReg.getSQLControl.text},
      ${ControlReg.getSQLControl.color},
      ${ControlReg.getSQLControl.image}
    )
    VALUES
    (
      "${noteGrid.text}",
      "${noteGrid.color}",
      "${noteGrid.image}"
    );''';

    final db = await ControlReg.getSQLControl.database;
    final result = await db.rawInsert(sql);

    ControlReg.getSQLControl.databaseLog('Add Grid Item', sql, null, result);
    this.updateState();
  }

  Future<void> updateGridItem() async {
    
  }

  Future<void> deleteGridItem(NotesGridModel noteGrid) async {
    final sql = '''DELETE FROM ${ControlReg.getSQLControl.notesGridItemTable} WHERE ${ControlReg.getSQLControl.id} = ${noteGrid.id};''';
    final sql2 = '''DELETE FROM ${ControlReg.getSQLControl.notesListItemTable} WHERE ${ControlReg.getSQLControl.id} = ${noteGrid.id};''';

    final db = await ControlReg.getSQLControl.database;
    final result = db.rawDelete(sql);
    final result2 = db.rawDelete(sql2);
    print(result);
    print(result2);
    this.updateState();
  }

  Future<void> addListItem(NotesListItemModel item) async {
    final sql = '''INSERT INTO ${ControlReg.getSQLControl.notesListItemTable}
    (
      ${ControlReg.getSQLControl.id},
      ${ControlReg.getSQLControl.text},
      ${ControlReg.getSQLControl.radio}
    )
    VALUES
    (
      ${item.id},
      "${item.text}",
      ${item.radio}
    );''';

    final db = await ControlReg.getSQLControl.database;
    final result = await db.rawInsert(sql);

    ControlReg.getSQLControl.databaseLog('Add List Item', sql, null, result);
    this.updateState();
  }

  Future<void> updateListItem(NotesListItemModel item) async {
    final sql = '''UPDATE ${ControlReg.getSQLControl.notesListItemTable}
    SET 
    ${ControlReg.getSQLControl.text} = "${item.text}",
    ${ControlReg.getSQLControl.radio} = ${item.radio}
    WHERE
    ${ControlReg.getSQLControl.primaryKey} = ${item.primaryKey};''';

    final db = await ControlReg.getSQLControl.database;
    final result = await db.rawUpdate(sql);

    ControlReg.getSQLControl.databaseLog("Update List Item", sql, null, result);
    this.updateState();
  }

  Future<void> deleteListItem(NotesListItemModel item) async {
    final sql = '''DELETE FROM ${ControlReg.getSQLControl.notesListItemTable}
    WHERE ${ControlReg.getSQLControl.primaryKey} = ${item.primaryKey}''';

    final db = await ControlReg.getSQLControl.database;
    final result = await db.rawDelete(sql);

    ControlReg.getSQLControl.databaseLog("Delete List Item", sql, null, result);
    this.updateState();
  }
}
