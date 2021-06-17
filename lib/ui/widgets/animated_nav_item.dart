import 'package:flutter/material.dart';

class SizeAnimation extends StatefulWidget {
  final bool selected;

  SizeAnimation({this.selected});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SizeAnimationState();
  }
}

class SizeAnimationState extends State<SizeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _widthAnimation;
  Animation<double> _heightAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = new AnimationController(
        duration: new Duration(milliseconds: 300), vsync: this);

    _widthAnimation = new Tween<double>(begin: 1, end: 1.5).animate(
        new CurvedAnimation(curve: Curves.easeInOut, parent: _controller));

    _heightAnimation = new Tween<double>(begin: 50.0, end: 250.0).animate(
        new CurvedAnimation(curve: Curves.easeInOut, parent: _controller));

    _controller.addListener(() {
      this.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    return Icon(
      Icons.home,
      color: Colors.white70,
      size: 25.0 * _widthAnimation.value,
    );
  }
}
