import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rooms_app/ui/widgets/status_item.dart';

class StatusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            StatusItem(
              icon: FontAwesomeIcons.houseUser,
              title: 'Back Home',
            ),
            StatusItem(
              icon: FontAwesomeIcons.carSide,
              title: 'Home Away',
            ),
            StatusItem(
              icon: FontAwesomeIcons.peopleCarry,
              title: 'Guest Mode',
            ),
          ],
        ),
      ),
    );
  }
}
