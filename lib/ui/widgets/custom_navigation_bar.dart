import 'package:flutter/material.dart';
import 'package:rooms_app/ui/widgets/animated_nav_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
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
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return index == _selectedIndex
                ? LinearGradient(
                    colors: [Colors.red, Colors.orangeAccent],
                    begin: Alignment(-1, -1),
                    end: Alignment(1, 1),
                  ).createShader(bounds)
                : LinearGradient(
                    colors: [Colors.white70, Colors.white70],
                    begin: Alignment(-1, -1),
                    end: Alignment(1, 1),
                  ).createShader(bounds);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizeAnimation(
                selected: index == _selectedIndex,
              ),
              Text(
                'Home',
                style: TextStyle(fontSize: 14.0, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
