import 'package:flutter/material.dart';

class DegreeToggleItem extends StatelessWidget {
  final Function toggle;
  final bool isToggled;
  final String title;
  final icon;

  DegreeToggleItem({this.toggle, this.isToggled, this.title, this.icon});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        title == "C°" ? toggle(1) : toggle(2);
      },
      child: Text(
        title,
        style: TextStyle(color: isToggled ? Color(0xFFEEDF62) : Colors.grey),
      ),
    );
  }
}
