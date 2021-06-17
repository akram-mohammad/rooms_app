import 'package:flutter/material.dart';
import 'package:rooms_app/ui/screens/rooms_list.dart';
import 'package:rooms_app/ui/screens/status_list.dart';
import 'package:rooms_app/ui/widgets/custom_navigation_bar.dart';

class RoomsHome extends StatefulWidget {
  @override
  _RoomsHomeState createState() => _RoomsHomeState();
}

class _RoomsHomeState extends State<RoomsHome> {
  int _selectedIndex = 0;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
            child: Text(
          'Rooms',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [StatusList(), RoomsList()],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.card_giftcard,
          Icons.camera,
          Icons.pie_chart,
        ],
        onChange: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
        defaultSelectedIndex: 1,
      ),
    );
  }
}
