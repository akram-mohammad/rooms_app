import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rooms_app/ui/widgets/air_slider_item.dart';

class AirConditionerSlider extends StatefulWidget {
  @override
  _AirConditionerSliderState createState() => _AirConditionerSliderState();
}

class _AirConditionerSliderState extends State<AirConditionerSlider> {
  int i = 0;
  int realId = 75;
  CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              FontAwesomeIcons.minus,
              color: Colors.white,
              size: 10.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: CarouselSlider.builder(
                carouselController: _controller,
                itemCount: 150,
                itemBuilder: (ctx, index, realIdx) {
                  i = index;
                  return AirSliderItem(
                    index: index,
                    realId: realId,
                  );
                },
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  initialPage: 75,
                  aspectRatio: 2.0,
                  enlargeCenterPage: false,
                  viewportFraction: 0.36,
                  onScrolled: (val) {
                    if (i == val.round() + 1) {
                      setState(() {
                        realId = i - 1;
                      });
                    } else if (i == val.round() - 1) {
                      setState(() {
                        realId = i + 1;
                      });
                    } else if (val.round() == 149.0) {
                      setState(() {
                        realId = 149;
                      });
                    } else if (val.round() == 0.0) {
                      setState(() {
                        realId = 0;
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
