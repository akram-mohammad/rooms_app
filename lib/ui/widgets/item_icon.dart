import 'package:flutter/material.dart';

class ItemIcon extends StatelessWidget {
  final IconData icon;
  ItemIcon(this.icon);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
            gradient: LinearGradient(
              colors: [Colors.red, Colors.orangeAccent],
              begin: Alignment(-1, -1),
              end: Alignment(1, 1),
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            size: 25.0,
          ),
        ),
      ),
    );
  }
}
