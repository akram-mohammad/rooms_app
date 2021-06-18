import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class GlobalSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterSlider(
      visibleTouchArea: true,
      touchSize: 5.0,
      values: [40],
      max: 100,
      min: 0,
      tooltip: FlutterSliderTooltip(
        disabled: true,
      ),
      handlerHeight: 23.0,
      handler: FlutterSliderHandler(
        decoration: BoxDecoration(),
        child: Container(
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
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
          inactiveTrackBar: BoxDecoration(color: Color(0xFF151824)),
          inactiveTrackBarHeight: 8),
      onDragging: (handlerIndex, lowerValue, upperValue) {},
    );
  }
}
