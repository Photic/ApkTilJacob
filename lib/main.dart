import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secure_personal_finance/view/notes/view_notes_list.dart';
import 'package:secure_personal_finance/view/view_finance.dart';
import 'package:secure_personal_finance/view/view_overview.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> viewItems = [
    Overview(),
    NotesList(),
    Finance()
  ];

  List<BottomNavigationBarItem> navigationItems = [
    BottomNavigationBarItem(title: Text("Overview"), icon: Icon(CupertinoIcons.circle)),
    BottomNavigationBarItem(title: Text("Notes"), icon: Icon(CupertinoIcons.pencil)),
    BottomNavigationBarItem(title: Text("Finance"), icon: Icon(CupertinoIcons.book_solid))
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Colors.red[600],
          textTheme: TextTheme(
            headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Colors.white),
            title: TextStyle(fontSize: 36.0, color: Colors.white),
            body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white),
            body2: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
        title: '',
        home: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(items: navigationItems),
          tabBuilder: (context, index) {
            return CupertinoTabView(
              builder: (context) {
                return Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.zero,
                    child: AppBar(),
                  ),
                  body: viewItems[index],
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
