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
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 9.0),
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          image: DecorationImage(
            image: AssetImage("assets/${room.img}"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(0.6), BlendMode.dstATop),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 15.0),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '22°C',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Row(
                    children: [
                      ItemIcon(
                        isMasked: false,
                        child: Icon(
                          FontAwesomeIcons.video,
                          size: 21.0,
                          color: Colors.white,
                        ),
                      ),
                      ItemIcon(
                        isMasked: false,
                        child: Icon(
                          FontAwesomeIcons.snowflake,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                      ItemIcon(
                        isMasked: true,
                        child: Icon(
                          FontAwesomeIcons.music,
                          size: 21.0,
                          color: Colors.black,
                        ),
                      ),
                      ItemIcon(
                        isMasked: true,
                        child: Icon(
                          FontAwesomeIcons.solidLightbulb,
                          size: 25,
                        ),
                      )
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
