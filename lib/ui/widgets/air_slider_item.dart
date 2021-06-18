import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math' as math;

class AirSliderItem extends StatefulWidget {
  final int realId;
  final int index;

  AirSliderItem({this.index, this.realId});
  @override
  _AirSliderItemState createState() => _AirSliderItemState();
}

class _AirSliderItemState extends State<AirSliderItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        widget.realId == widget.index
            ? Container(
                width: 45.0,
                child: Center(
                  child: Text(
                    '${widget.index - 50}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 25.0),
                  ),
                ),
              )
            : Container(
                width: 34.0,
                child: Center(
                  child: Text(
                    '${widget.index - 50}',
                    style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0),
                  ),
                ),
              ),
        (widget.realId == widget.index || widget.realId - 1 == widget.index)
            ? Row(
                children: [
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(FontAwesomeIcons.minus,
                        size: 10.0, color: Colors.yellow[400]),
                  ),
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(FontAwesomeIcons.minus,
                        size: 10.0, color: Colors.yellow[400]),
                  ),
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(FontAwesomeIcons.minus,
                        size: 10.0, color: Colors.yellow[400]),
                  ),
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(FontAwesomeIcons.minus,
                        size: 10.0, color: Colors.yellow[400]),
                  ),
                ],
              )
            : Row(
                children: [
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(FontAwesomeIcons.minus,
                        size: 10.0, color: Colors.white60),
                  ),
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(FontAwesomeIcons.minus,
                        size: 10.0, color: Colors.white60),
                  ),
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(FontAwesomeIcons.minus,
                        size: 10.0, color: Colors.white60),
                  ),
                  Transform.rotate(
                    angle: 90 * math.pi / 180,
                    child: Icon(FontAwesomeIcons.minus,
                        size: 10.0, color: Colors.white60),
                  ),
                ],
              ),
      ],
    );
  }
}
