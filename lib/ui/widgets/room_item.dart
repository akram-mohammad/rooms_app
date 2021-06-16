import 'package:flutter/material.dart';
import 'package:rooms_app/core/models/Room.dart';

class RoomItem extends StatelessWidget {
  final Room room;
  RoomItem({this.room});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          image: DecorationImage(
            image: AssetImage("assets/${room.img}"),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Text(room.name),
      ),
    );
  }
}
