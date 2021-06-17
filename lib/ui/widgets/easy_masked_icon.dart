import 'package:flutter/material.dart';

class EasyMaskedIcon extends StatelessWidget {
  final Widget child;
  EasyMaskedIcon({this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFD92B56), Color(0xFFF1A71C)],
              begin: Alignment(-1, -1),
              end: Alignment(1, 1),
            ),
            shape: BoxShape.circle),
        child: Center(child: child),
      ),
    );
  }
}
