import 'package:flutter/material.dart';

class TranslateAnimation extends StatefulWidget {
  TranslateAnimation(
      {Key key, this.child,})
      : super(key: key);

  final Widget child;

  @override
  _TranslateAnimationState createState() {
    return _TranslateAnimationState();
  }
}

class _TranslateAnimationState extends State<TranslateAnimation>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..addListener(() => setState(() {}));

    _animation = Tween(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform(
                  transform: Matrix4.translationValues(
                      _animation.value *10, 0.0, 0.0),
                  child: widget.child);
            }),

      ],
    );
  }


}
