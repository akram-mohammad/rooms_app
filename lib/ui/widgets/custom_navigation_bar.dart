import 'package:flutter/material.dart';
import 'package:rooms_app/ui/widgets/animated_nav_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;
  final List<String> labelList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      @required this.labelList,
      @required this.iconList,
      @required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList
          .add(buildNavBarItem(_iconList[i], i, widget.labelList[i]));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index, String label) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        color: Theme.of(context).bottomAppBarColor,
        height: 70,
        width: MediaQuery.of(context).size.width / _iconList.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return index == _selectedIndex
                    ? LinearGradient(
                        colors: [Color(0xFFD92B56), Color(0xFFF1A71C)],
                        begin: Alignment(-1, -1),
                        end: Alignment(1, 1),
                      ).createShader(bounds)
                    : LinearGradient(
                        colors: [Colors.white70, Colors.white70],
                        begin: Alignment(-1, -1),
                        end: Alignment(1, 1),
                      ).createShader(bounds);
              },
              child: Container(
                height: 30,
                child: SizeAnimation(
                  icon: icon,
                  selected: index == _selectedIndex,
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return index == _selectedIndex
                    ? LinearGradient(
                        colors: [Color(0xFFAC286A), Color(0xFFEBAC17)],
                      ).createShader(bounds)
                    : LinearGradient(
                        colors: [Colors.white70, Colors.white70],
                        begin: Alignment(-1, -1),
                        end: Alignment(1, 1),
                      ).createShader(bounds);
              },
              child: Text(
                label,
                style: TextStyle(fontSize: 14.0, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
