import 'package:flutter/material.dart';
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
              icon: Icons.home,
              title: 'Back Home',
            ),
            StatusItem(
              icon: Icons.home,
              title: 'Home Away',
            ),
            StatusItem(
              icon: Icons.home,
              title: 'Guest Mode',
            ),
          ],
        ),
      ),
    );
  }
}
