
import 'package:secure_personal_finance/control/sqlite_control.dart';

class ControlReg {
  static var _sqlControl;
  
  static SQLiteControl get getSQLControl {if (_sqlControl == null) _sqlControl = SQLiteControl(); return _sqlControl;}
}