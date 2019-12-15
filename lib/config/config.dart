import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
///
/// Default values
///
///

// ! Styling
double defaultPadding = 8;

// ! Keys
String keyAddGrid = "addGrid";

// ! Functions
void popView(BuildContext context) {
  Navigator.of(context).pop(true);
}

// ! Widgets
Widget goBack(BuildContext context) {
  return Positioned(
    top: 50,
    right: 0,
    child: ButtonTheme(
      minWidth: 5,
      child: IconButton(
        onPressed: () => popView(context),
        icon: Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    ),
  );
}
