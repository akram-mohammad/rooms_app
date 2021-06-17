import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rooms_app/core/models/Room.dart';
import 'package:rooms_app/ui/widgets/item_icon.dart';

class RoomItem extends StatelessWidget {
  final Room room;
  RoomItem({this.room});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          image: DecorationImage(
            image: AssetImage("assets/${room.img}"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.dstATop),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                room.name,
                style: Theme.of(context).textTheme.headline2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '22oC',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Row(
                    children: [
                      ItemIcon(Icons.videocam_rounded),
                      ItemIcon(FontAwesomeIcons.snowflake),
                      ItemIcon(Icons.queue_music_outlined),
                      ItemIcon(Icons.lightbulb)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
