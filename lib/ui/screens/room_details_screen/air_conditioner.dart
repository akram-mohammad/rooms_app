import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rooms_app/ui/widgets/air_conditioner_slider.dart';
import 'package:rooms_app/ui/widgets/custom_switch.dart';
import 'package:rooms_app/ui/widgets/easy_masked_icon.dart';

class AirConditionerComp extends StatefulWidget {
  final Size mediaQuery;
  final Function callback;
  AirConditionerComp(this.mediaQuery, {this.callback});
  @override
  _AirConditionerCompState createState() => _AirConditionerCompState();
}

class _AirConditionerCompState extends State<AirConditionerComp> {
  double _currentSliderValue = 0.0;
  bool _currentSwitchValue = true;

  LinearGradient gradient = LinearGradient(colors: <Color>[
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.blue[900],
    Colors.purple
  ]);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.mediaQuery.height * 0.17,
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
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    EasyMaskedIcon(
                      child: Icon(
                        FontAwesomeIcons.snowflake,
                        size: 26,
                        color: Color(0xFF2D313D),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Air Conditioner',
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
                          print("VALUE : $value");
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

            Row(
              children: [
                Expanded(
                  child: SizedBox(),
                  flex: 1,
                ),
                Icon(
                  FontAwesomeIcons.minus,
                  color: Colors.white,
                  size: 10.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 4,
                  child: AirConditionerSlider(),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  FontAwesomeIcons.plus,
                  color: Colors.white,
                  size: 12.0,
                ),
              ],
            )
            // Slider.adaptive(
            //   value: _currentSliderValue,
            //   min: 0,
            //   max: 100,
            //   label: _currentSliderValue.round().toString(),
            //   onChanged: (double value) {
            //     setState(() {
            //       _currentSliderValue = value;
            //     });
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
