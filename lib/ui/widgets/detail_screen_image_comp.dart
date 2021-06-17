import 'package:flutter/material.dart';

class RoomDetailImageComp extends StatelessWidget {
  final Size mediaQuery;

  RoomDetailImageComp(this.mediaQuery);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQuery.height * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/img/rooms/living.png'),
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.5), BlendMode.dstATop),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Living Room',
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Temperature',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '22 °C',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Humidity',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '08 °C',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Power Consumption',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            '23 ',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        Text(
                          'kWh',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
