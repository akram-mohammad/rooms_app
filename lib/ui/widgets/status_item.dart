import 'package:flutter/material.dart';

class StatusItem extends StatelessWidget {
  final IconData icon;
  final String title;

  StatusItem({this.icon, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
            colors: [Colors.red, Colors.orangeAccent],
            begin: Alignment(-1, -1),
            end: Alignment(1, 1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Icon(icon), Text(title)],
        ),
      ),
    );
  }
}
