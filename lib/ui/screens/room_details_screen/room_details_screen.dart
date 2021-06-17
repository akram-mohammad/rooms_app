import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rooms_app/ui/widgets/detail_screen_image_comp.dart';
import 'package:rooms_app/ui/widgets/easy_masked_icon.dart';
import 'package:rooms_app/ui/widgets/item_icon.dart';

class RoomDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.white,
          size: 20.0,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          RoomDetailImageComp(mediaQuery),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: mediaQuery.height * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        colors: [Color(0xFF2D313D), Color(0xFF242731)],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          ItemIcon(
                            isMasked: false,
                            child: Icon(
                              FontAwesomeIcons.video,
                              size: 19.0,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            'Live Camera View',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: mediaQuery.height * 0.17,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: LinearGradient(
                        colors: [Color(0xFF2D313D), Color(0xFF242731)],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                                      size: 24,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Text(
                                    'Lightings',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  )
                                ],
                              ),
                              Switch.adaptive(value: false, onChanged: (val) {})
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
