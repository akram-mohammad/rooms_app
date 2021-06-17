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
            colors: [Color(0xFFD92B56), Color(0xFFF1A71C)],
            begin: Alignment(-1, -1),
            end: Alignment(1, 1),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 32.0,
              color: Colors.white,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
