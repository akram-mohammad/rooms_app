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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StatusList(),
            SizedBox(
              height: 2.0,
            ),
            RoomsList(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.watch_later_outlined,
          Icons.flash_on_rounded,
          Icons.menu,
        ],
        labelList: ['Home', 'Schedule', 'Power', 'More'],
        onChange: (val) {
          if (_selectedIndex != val) {
            setState(() {
              _selectedIndex = val;
            });
          }
        },
        defaultSelectedIndex: 1,
      ),
    );
  }
}
