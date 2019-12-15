//import 'package:secure_personal_finance/store/view_grocery_list_state.dart';
import 'package:secure_personal_finance/store/notes_store.dart';

class ControlState {
  static var _viewNotes;

  static NotesStore get getNotesViewState {
    if (_viewNotes == null) _viewNotes = NotesStore();
    return _viewNotes;
  }
}
