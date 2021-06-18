import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rooms_app/ui/widgets/air_conditioner_slider.dart';
import 'package:rooms_app/ui/widgets/custom_switch.dart';
import 'package:rooms_app/ui/widgets/degree_toggle_item.dart';
import 'package:rooms_app/ui/widgets/easy_masked_icon.dart';
import 'dart:math' as math;

import 'package:rooms_app/ui/widgets/item_icon.dart';

class AirConditionerComp extends StatefulWidget {
  final Size mediaQuery;

  AirConditionerComp(this.mediaQuery);
  @override
  _AirConditionerCompState createState() => _AirConditionerCompState();
}

class _AirConditionerCompState extends State<AirConditionerComp> {
  double _currentSliderValue = 0.0;
  bool _currentSwitchValue = true;
  bool isToggled = true;
  int index = 1;

  void toggle(int i) {
    if (index != i) {
      setState(() {
        isToggled = !isToggled;
      });
    }
    index = i;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFF2D313D),
            Color(0xFF242731),
          ],
          begin: Alignment(-1, -1),
          end: Alignment(1, 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, top: 10.0, bottom: 10.0, right: 15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _currentSwitchValue
                        ? EasyMaskedIcon(
                            child: Icon(
                              FontAwesomeIcons.snowflake,
                              size: 26,
                              color: Color(0xFF2D313D),
                            ),
                          )
                        : ItemIcon(
                            child: Icon(
                              FontAwesomeIcons.snowflake,
                              size: 24,
                              color: Colors.white,
                            ),
                            isMasked: false),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Air Conditioner',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    if (_currentSwitchValue && widget.mediaQuery.width >= 370)
                      Container(
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 1,
                            ),
                            Expanded(
                                child: DegreeToggleItem(
                              toggle: toggle,
                              isToggled: isToggled,
                              title: 'C°',
                              icon: Icons.wb_sunny,
                            )),
                            Transform.rotate(
                              angle: 90 * math.pi / 180,
                              child: Icon(FontAwesomeIcons.minus,
                                  size: 10.0,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: DegreeToggleItem(
                              toggle: toggle,
                              isToggled: !isToggled,
                              title: 'F°',
                              icon: Icons.cloud_sharp,
                            )),
                          ],
                        ),
                      )
                  ],
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomSwitch(
                        activeColor: Colors.pinkAccent,
                        value: _currentSwitchValue,
                        onChanged: (value) {
                          setState(() {
                            _currentSwitchValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (_currentSwitchValue)
              Padding(
                padding: (widget.mediaQuery.width <= 370)
                    ? const EdgeInsets.symmetric(horizontal: 5.0)
                    : EdgeInsets.zero,
                child: Row(
                  children: [
                    if (widget.mediaQuery.width >= 370)
                      Expanded(
                        child: SizedBox(),
                        flex: 1,
                      ),
                    Expanded(
                      flex: 5,
                      child: AirConditionerSlider(),
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
