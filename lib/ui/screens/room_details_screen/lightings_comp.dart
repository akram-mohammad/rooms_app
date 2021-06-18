import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rooms_app/ui/widgets/custom_switch.dart';
import 'package:rooms_app/ui/widgets/easy_masked_icon.dart';
import 'package:rooms_app/ui/widgets/global_slider.dart';

class LightingComp extends StatefulWidget {
  final Size mediaQuery;
  final Function callback;
  LightingComp(this.mediaQuery, {this.callback});
  @override
  _LightingCompState createState() => _LightingCompState();
}

class _LightingCompState extends State<LightingComp> {
  bool _currentSwitchValue = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _currentSwitchValue
          ? widget.mediaQuery.height * 0.16
          : widget.mediaQuery.height * 0.09,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    EasyMaskedIcon(
                      child: Icon(
                        FontAwesomeIcons.solidLightbulb,
                        size: 25,
                        color: Color(0xFF2D313D),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Lightings',
                      style: Theme.of(context).textTheme.headline6,
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
              Row(
                children: [
                  Expanded(
                    child: SizedBox(),
                    flex: 1,
                  ),
                  Icon(
                    Icons.fiber_manual_record,
                    color: Colors.white,
                    size: 18.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    flex: 4,
                    child: GlobalSlider(),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
