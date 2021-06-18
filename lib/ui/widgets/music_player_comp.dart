import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MusicPlayerComp extends StatefulWidget {
  @override
  _MusicPlayerCompState createState() => _MusicPlayerCompState();
}

class _MusicPlayerCompState extends State<MusicPlayerComp> {
  bool playing = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                image: DecorationImage(
                  image: AssetImage('assets/img/rooms/bruno.png'),
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Uptown Funk',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),
                ),
                Text('ft. Bruno Mars',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0)),
              ],
            )
          ],
        ),
        Row(
          children: [
            Icon(
              FontAwesomeIcons.backward,
              color: Colors.white,
              size: 20.0,
            ),
            SizedBox(
              width: 8.0,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: new CircularPercentIndicator(
                radius: 45.0,
                lineWidth: 3.0,
                percent: 0.7,
                center: new GestureDetector(
                  child: Icon(
                    playing ? Icons.play_arrow_sharp : Icons.pause,
                  ),
                  onTap: () {
                    setState(() {
                      playing = !playing;
                    });
                  },
                ),
                linearGradient: LinearGradient(
                  colors: [Color(0xFFD92B56), Color(0xFFF1A71C)],
                  begin: Alignment(-1, -1),
                  end: Alignment(1, 1),
                ),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Icon(
              FontAwesomeIcons.forward,
              color: Colors.white,
              size: 20.0,
            ),
          ],
        )
      ],
    );
  }
}
