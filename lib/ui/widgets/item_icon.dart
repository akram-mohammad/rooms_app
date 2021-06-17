import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rooms_app/ui/widgets/masked_image.dart';

class ItemIcon extends StatelessWidget {
  ItemIcon({
    Key key,
    @required this.child,
    @required this.isMasked,
  }) : super(key: key);

  final Widget child;
  final bool isMasked;

  @override
  Widget build(BuildContext context) {
    Rect myRect = Offset.zero & Size(40, 40);
    return isMasked
        ? Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: ClipOval(
              child: CustomOutlineButton(
                width: 45.0,
                height: 45.0,
                gradient: LinearGradient(
                  colors: [Color(0xFFD92B56), Color(0xFFF1A71C)],
                  begin: Alignment(-1, -1),
                  end: Alignment(1, 1),
                ),
                child: ShaderMask(
                    blendMode: BlendMode.srcOut,
                    shaderCallback: (bounds) => LinearGradient(
                          colors: [Color(0xFFDE5252), Color(0xFFEC8E2C)],
                          begin: Alignment(-1, -1),
                          end: Alignment(1, 1),
                        ).createShader(bounds),
                    child: child),
                onPressed: () {},
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                  shape: BoxShape.circle),
              child: child,
            ),
          );
  }
}
