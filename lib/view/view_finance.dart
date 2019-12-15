import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Finance extends StatefulWidget {
  Finance({Key key}) : super(key: key);

  _FinanceState createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text("Date"),
            numeric: false,
          ),
          DataColumn(label: Text("Beløb"))
        ],
        rows: [
          DataRow(
            cells: [
              DataCell(Text("First")),
              DataCell(Text("1000"))
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text("Second")),
              DataCell(Text("2000"))
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text("Third")),
              DataCell(Text("3000"))
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text("Fourth")),
              DataCell(Text("4000"))
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text("Fift")),
              DataCell(Text("5000"))
            ],
          ),
        ],
      ),
    );
  }
}
