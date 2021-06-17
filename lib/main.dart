import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rooms_app/core/providers/room_provider.dart';
import 'package:rooms_app/ui/screens/rooms_home.dart';
import 'package:rooms_app/ui/screens/rooms_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomsProvider(),
      child: MaterialApp(
        title: 'Rooms App',
        theme: ThemeData(
          primaryColor: Color(0xFF151824),
          bottomAppBarColor: Color(0xFF1C2136),
          accentColor: Colors.orangeAccent,
          primarySwatch: Colors.blue,
          fontFamily: 'Carmen',
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 72.0,
                fontWeight: FontWeight.w900,
                color: Colors.white),
            headline2: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w700,
                color: Colors.white),
            headline3: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            headline4: TextStyle(fontSize: 30.0, color: Colors.white),
            headline5: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
                color: Colors.white),
          ),
        ),
        home: MyHomePage(title: 'Rooms'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return RoomsHome();
  }
}
