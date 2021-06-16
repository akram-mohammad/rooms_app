import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rooms_app/core/providers/room_provider.dart';
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
        theme: ThemeData(primarySwatch: Colors.blue),
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
    return Scaffold(
        backgroundColor: Color(0xFF151824),
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Color(0xFF151824),
          title: Center(child: Text(widget.title)),
        ),
        body: RoomsList());
  }
}
