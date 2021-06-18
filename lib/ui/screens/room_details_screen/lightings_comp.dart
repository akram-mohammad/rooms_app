import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rooms_app/ui/widgets/custom_switch.dart';
import 'package:rooms_app/ui/widgets/easy_masked_icon.dart';

class LightingComp extends StatefulWidget {
  final Size mediaQuery;
  final Function callback;
  LightingComp(this.mediaQuery, {this.callback});
  @override
  _LightingCompState createState() => _LightingCompState();
}

class _LightingCompState extends State<LightingComp> {
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
        padding: const EdgeInsets.only(
            left: 10.0, top: 10.0, bottom: 10.0, right: 15.0),
        child: Column(
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
                  Icons.fiber_manual_record,
                  color: Colors.white,
                  size: 18.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  flex: 4,
                  child: FlutterSlider(
                    values: [40],
                    max: 100,
                    min: 0,
                    tooltip: FlutterSliderTooltip(
                      disabled: true,
                    ),
                    handlerHeight: 25.0,
                    handler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                    handlerAnimation: FlutterSliderHandlerAnimation(
                        curve: Curves.elasticOut,
                        reverseCurve: null,
                        duration: Duration(milliseconds: 700),
                        scale: 1.1),
                    trackBar: FlutterSliderTrackBar(
                        activeTrackBar: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xFFD42B7B), Color(0xFFF3AD17)],
                                begin: Alignment(-1, -1),
                                end: Alignment(1, 1),
                                stops: [0.45, 0.55]),
                            borderRadius: BorderRadius.circular(5)),
                        activeTrackBarHeight: 8,
                        inactiveTrackBar:
                            BoxDecoration(color: Color(0xFF151824)),
                        inactiveTrackBarHeight: 8),
                    onDragging: (handlerIndex, lowerValue, upperValue) {},
                  ),
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
