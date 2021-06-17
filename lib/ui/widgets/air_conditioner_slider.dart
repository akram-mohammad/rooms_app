import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AirConditionerSlider extends StatefulWidget {
  @override
  _AirConditionerSliderState createState() => _AirConditionerSliderState();
}

class _AirConditionerSliderState extends State<AirConditionerSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        itemBuilder: (ctx, index) {
          return Row(
            children: [
              Text('$index'),
              Row(
                children: [
                  Icon(Icons.vertical_align_top),
                  Icon(Icons.vertical_align_top),
                  Icon(Icons.vertical_align_top),
                  Icon(Icons.vertical_align_top),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
