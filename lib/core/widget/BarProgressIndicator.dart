//@dart=2.9
import 'package:flutter/material.dart';

class _BarProgressIndicatorState extends State<BarProgressIndicator>
    with TickerProviderStateMixin {
  int numberOfBars;
  int milliseconds;
  double fontSize;
  double barSpacing;
  Color color;
  double beginTweenValue;
  double endTweenValue;
  List<AnimationController> controllers = [];
  List<Animation<double>> animations = [];
  List<Widget> widgets = [];

  _BarProgressIndicatorState({
    this.numberOfBars,
    this.fontSize,
    this.color,
    this.barSpacing,
    this.milliseconds,
    this.beginTweenValue,
    this.endTweenValue,
  });

  @override
  initState() {
    super.initState();
    for (int i = 0; i < numberOfBars; i++) {
      _addAnimationControllers();
      _buildAnimations(i);
      _addListOfDots(i);
    }

    controllers[0].forward();
  }

  void _addAnimationControllers() {
    controllers.add(AnimationController(
        duration: Duration(milliseconds: milliseconds), vsync: this));
  }

  void _addListOfDots(int index) {
    widgets.add(Padding(
      padding: EdgeInsets.only(right: barSpacing),
      child: _AnimatingBar(
        animation: animations[index],
        fontSize: fontSize,
        color: color,
      ),
    ));
  }

  void _buildAnimations(int index) {
    animations.add(Tween(
        begin: widget.beginTweenValue, end: widget.endTweenValue)
        .animate(controllers[index])
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          controllers[index].reverse();
        }
        if (index == numberOfBars - 1 && status == AnimationStatus.dismissed) {
          controllers[0].forward();
        }
        if (animations[index].value > widget.endTweenValue / 2 &&
            index < numberOfBars - 1) {
          controllers[index + 1].forward();
        }
      }));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets,
      ),
    );
  }

  @override
  dispose() {
    for (int i = 0; i < numberOfBars; i++) {
      controllers[i].dispose();
    }
    super.dispose();
  }
}

class BarProgressIndicator extends StatefulWidget {
  final int numberOfBars;
  final double fontSize;
  final double barSpacing;
  final Color color;
  final int milliseconds;
  final double beginTweenValue;
  final double endTweenValue;

     const BarProgressIndicator({Key key,
    this.numberOfBars = 3,
    this.fontSize = 10.0,
    this.color = Colors.black,
    this.barSpacing = 0.0,
    this.milliseconds = 250,
    this.beginTweenValue = 5.0,
    this.endTweenValue = 10.0,
  }) : super(key: key);

  @override
  _BarProgressIndicatorState createState() => _BarProgressIndicatorState(
    numberOfBars: numberOfBars,
    fontSize: fontSize,
    color: color,
    barSpacing: barSpacing,
    milliseconds: milliseconds,
    beginTweenValue: beginTweenValue,
    endTweenValue: endTweenValue,
  );
}

class _AnimatingBar extends AnimatedWidget {
  final Color color;
  final double fontSize;

  const _AnimatingBar(
      {Key key, Animation<double> animation, this.color, this.fontSize})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      height: animation.value,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(2.0),
        color: color,
      ),
      width: fontSize,
    );
  }
}
