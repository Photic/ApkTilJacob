// Flutter
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

// Basic
import 'package:secure_personal_finance/model/pie_view_model/pie_view_model.dart';

class Overview extends StatefulWidget {
  Overview({Key key}) : super(key: key);
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {

  List<Series<LinearSales, int>> createSampleData() {
    final data = [
      new LinearSales(0, 1000),
      new LinearSales(1, 2000),
      new LinearSales(2, 3000),
      new LinearSales(3, 4000),
      new LinearSales(4, 5000),
    ];

    return [
      new Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: 400,
              height: 400,
              child: PieOutsideLabelChart(this.createSampleData()),
            ),
          ],
        ),
      ),
    );
  }
}
