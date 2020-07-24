import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  final int duration;
  final TextStyle textStyle;
  CountDownTimer({Key key, this.duration, this.textStyle}) : super(key: key);

  @override
  _CountDownTimerState createState() {
    return _CountDownTimerState();
  }
}

class _CountDownTimerState extends State<CountDownTimer> with TickerProviderStateMixin {

  AnimationController controller;

  String get hours  {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inHours).toString().padLeft(2,'0')}';

  }
  String get minutes  {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inMinutes%60).toString().padLeft(2,'0')}';

  }
  String get seconds  {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

  }
  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: widget.duration),
    );
    controller.reverse(from: controller.value ==0.0? 1.0:controller.value);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, snapshot) {
        return Row(
          children: <Widget>[
            Text("Berakhir dalam",style: TextStyle(color: Colors.white,fontSize: 12),),
            SizedBox(width: 14,),
            Container(
              width: 27,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4)
              ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("$hours",style: widget.textStyle,textAlign: TextAlign.center,),
                )),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(":",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
            ),
            Container(width: 27,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("$minutes",style: widget.textStyle,textAlign: TextAlign.center,),
                )),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(":",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
            ),
            Container(
              width: 27,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text("$seconds",style: widget.textStyle,textAlign: TextAlign.center,),
                ))
          ],
        );
      }
    );
  }
}