import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rooms_app/ui/widgets/air_conditioner_slider.dart';
import 'package:rooms_app/ui/widgets/easy_masked_icon.dart';
import 'package:rooms_app/ui/widgets/global_slider.dart';
import 'package:rooms_app/ui/widgets/music_player_comp.dart';

class MusicPlayer extends StatefulWidget {
  final Size mediaQuery;
  MusicPlayer(this.mediaQuery);
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                EasyMaskedIcon(
                    child: Icon(
                  FontAwesomeIcons.music,
                  size: 21.0,
                  color: Color(0xFF2D313D),
                )),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Music Player',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
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
                    child: MusicPlayerComp(),
                  ),
                ],
              ),
            ),
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
                  Icon(
                    FontAwesomeIcons.volumeMute,
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
                    FontAwesomeIcons.volumeUp,
                    color: Colors.white,
                    size: 18.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
