//@dart=2.9

import 'dart:math';

import 'package:flutter/material.dart';

import '../content.dart';

Widget showAlert(
    {BuildContext context,
    Function yesFunction,    Function noFunction,
    String message,color=Colors.red,
      hIcon= const Icon(
Icons.error_outline,
size: 60, color: Colors.grey,),
    String state}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            hIcon,
            const SizedBox(
              height: 15,
            ),
            Text(
              message ?? 'Are you Sure',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
        actions: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(height: 30),
              Positioned(
                top: 0,
                left: -20,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  onPressed: noFunction!=null?noFunction:() {

                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.arrow_back,
                        size: 10,
                      ),
                      Text('  No    '),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: -20,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          state == 'update' ? Colors.green : color)),
                  onPressed: yesFunction,
                  child: Row(
                    children: [
                      Text(state??"YES",style: bodyTextStyle16(color: AppColors.white)),
                      const Icon(
                        Icons.arrow_forward_outlined,
                        size: 10,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

showAlertInteractive({BuildContext context,message,icon=Icons.warning_amber_rounded,color=AppColors.main}) {
  return showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      isDismissible: false,
      backgroundColor: Colors.transparent,
      builder: (context) => WillPopScope(
        onWillPop:(){

          return Future.value(true);
        },
        child: Container(
            height: MediaQuery.of(context).size.height * .6,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25), topRight: Radius.circular(25))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Icon(icon,
                    size: 100, color: color),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(message,
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      style: bodyTextStyle24(color:color)),
                ),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                    color: color,
                    elevation: 0,
                    child: Text('Back',
                        style: bodyTextStyle20(color: AppColors.white)),
                    onPressed: () {

                      Navigator.of(context).pop();
                    })
              ],
            )),
      ));
}




typedef ControllerCallback = void Function(AnimationController);

enum DismissType { onTap, onSwipe, none }

OverlayEntry _previousEntry;


void showTopSnackBar(
    BuildContext context,
    Widget child, {
      Duration animationDuration = const Duration(milliseconds: 1200),
      Duration reverseAnimationDuration = const Duration(milliseconds: 550),
      Duration displayDuration = const Duration(milliseconds: 1000),
      VoidCallback onTap,
      OverlayState overlayState,
      bool persistent = false,
      ControllerCallback onAnimationControllerInit,
      EdgeInsets padding = const EdgeInsets.all(16),
      Curve curve = Curves.elasticOut,
      Curve reverseCurve = Curves.linearToEaseOut,
      SafeAreaValues safeAreaValues = const SafeAreaValues(),
      DismissType dismissType = DismissType.onTap,
      DismissDirection dismissDirection = DismissDirection.up,
    }) async {
  overlayState ??= Overlay.of(context);
   OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) {
      return TopSnackBar(
        child: child,
        onDismissed: () {
          if (overlayEntry.mounted && _previousEntry == overlayEntry) {
            overlayEntry.remove();
            _previousEntry = null;
          }
        },
        animationDuration: animationDuration,
        reverseAnimationDuration: reverseAnimationDuration,
        displayDuration: displayDuration,
        onTap: onTap,
        persistent: persistent,
        onAnimationControllerInit: onAnimationControllerInit,
        padding: padding,
        curve: curve,
        reverseCurve: reverseCurve,
        safeAreaValues: safeAreaValues,
        dismissType: dismissType,
        dismissDirection: dismissDirection,
      );
    },
  );

  if (_previousEntry != null && _previousEntry.mounted) {
    _previousEntry?.remove();
  }
  overlayState?.insert(overlayEntry);
  _previousEntry = overlayEntry;
}
class CustomSnackBar extends StatefulWidget {
  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int maxLines;
  final int iconRotationAngle;
  final List<BoxShadow> boxShadow;
  final BorderRadius borderRadius;
  final double iconPositionTop;
  final double iconPositionLeft;
  final EdgeInsetsGeometry messagePadding;
  final double textScaleFactor;

  const CustomSnackBar.success({
    Key key,
    this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.sentiment_very_satisfied,
      color: const Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xff00b85d),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
  });

   CustomSnackBar.info({
    Key key,
     this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.sentiment_neutral,
      color: const Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = AppColors.kPrimaryAmberColor,
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
  });

  const CustomSnackBar.error({
    Key key,
     this.message,
    this.messagePadding = const EdgeInsets.symmetric(horizontal: 24),
    this.icon = const Icon(
      Icons.error_outline,
      color: const Color(0x15000000),
      size: 120,
    ),
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    ),
    this.maxLines = 2,
    this.iconRotationAngle = 32,
    this.iconPositionTop = -10,
    this.iconPositionLeft = -8,
    this.backgroundColor = const Color(0xffff5252),
    this.boxShadow = kDefaultBoxShadow,
    this.borderRadius = kDefaultBorderRadius,
    this.textScaleFactor = 1.0,
  });

  @override
  _CustomSnackBarState createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 80,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: widget.borderRadius,
        boxShadow: widget.boxShadow,
      ),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: widget.iconPositionTop,
            left: widget.iconPositionLeft,
            child: Container(
              height: 95,
              child: Transform.rotate(
                angle: widget.iconRotationAngle * pi / 180,
                child: widget.icon,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: widget.messagePadding,
              child: Text(
                widget.message,
                style: theme.textTheme.bodyText2?.merge(
                  widget.textStyle,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: widget.maxLines,
                textScaleFactor: widget.textScaleFactor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const kDefaultBoxShadow = const [
  BoxShadow(
    color: Colors.black26,
    offset: Offset(0.0, 8.0),
    spreadRadius: 1,
    blurRadius: 30,
  ),
];

const kDefaultBorderRadius = const BorderRadius.all(Radius.circular(12));
class TopSnackBar extends StatefulWidget {
  final Widget child;
  final VoidCallback onDismissed;
  final Duration animationDuration;
  final Duration reverseAnimationDuration;
  final Duration displayDuration;
  final VoidCallback onTap;
  final ControllerCallback onAnimationControllerInit;
  final bool persistent;
  final EdgeInsets padding;
  final Curve curve;
  final Curve reverseCurve;
  final SafeAreaValues safeAreaValues;
  final DismissType dismissType;
  final DismissDirection dismissDirection;

  TopSnackBar({
    Key key,
     this.child,
     this.onDismissed,
     this.animationDuration,
     this.reverseAnimationDuration,
     this.displayDuration,
    this.onTap,
    this.persistent = false,
    this.onAnimationControllerInit,
     this.padding,
     this.curve,
     this.reverseCurve,
     this.safeAreaValues,
    this.dismissType = DismissType.onTap,
    this.dismissDirection = DismissDirection.up,
  }) : super(key: key);

  @override
  _TopSnackBarState createState() => _TopSnackBarState();
}

class _TopSnackBarState extends State<TopSnackBar>
    with SingleTickerProviderStateMixin {
   Animation offsetAnimation;
   AnimationController animationController;

  @override
  void initState() {
    _setupAndStartAnimation();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _setupAndStartAnimation() async {
    animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
      reverseDuration: widget.reverseAnimationDuration,
    );

    widget.onAnimationControllerInit?.call(animationController);

    Tween<Offset> offsetTween = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    );

    offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: widget.curve,
        reverseCurve: widget.reverseCurve,
      ),
    )..addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(widget.displayDuration);
        _dismiss();
      }

      if (status == AnimationStatus.dismissed) {
        if (mounted) {
          widget.onDismissed.call();
        }
      }
    });

    if (mounted) {
      animationController.forward();
    }
  }

  void _dismiss() {
    if (!widget.persistent && mounted) {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.padding.top,
      left: widget.padding.left,
      right: widget.padding.right,
      child: SlideTransition(
        position: offsetAnimation as Animation<Offset>,
        child: SafeArea(
          top: widget.safeAreaValues.top,
          bottom: widget.safeAreaValues.bottom,
          left: widget.safeAreaValues.left,
          right: widget.safeAreaValues.right,
          minimum: widget.safeAreaValues.minimum,
          maintainBottomViewPadding:
          widget.safeAreaValues.maintainBottomViewPadding,
          child: _buildDismissibleChild(),
        ),
      ),
    );
  }

  /// Build different type of [Widget] depending on [DismissType] value
  Widget _buildDismissibleChild() {
    switch (widget.dismissType) {
      case DismissType.onTap:
        return TapBounceContainer(
          onTap: () {
            if (mounted) {
              widget.onTap?.call();
              _dismiss();
            }
          },
          child: widget.child,
        );
      case DismissType.onSwipe:
        return Dismissible(
          direction: widget.dismissDirection,
          key: UniqueKey(),
          onDismissed: (direction) => _dismiss(),
          child: widget.child,
        );
      case DismissType.none:
        return widget.child;
    }
  }
}
class TapBounceContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  TapBounceContainer({
    this.child,
    this.onTap,
  });

  @override
  _TapBounceContainerState createState() => _TapBounceContainerState();
}

class _TapBounceContainerState extends State<TapBounceContainer>
    with SingleTickerProviderStateMixin {
  double _scale;
  AnimationController _controller;

  final animationDuration = Duration(milliseconds: 200);

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
      lowerBound: 0.0,
      upperBound: 0.04,
    )..addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onPanEnd: _onPanEnd,
      child: Transform.scale(
        scale: _scale,
        child: widget.child,
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    if (mounted) {
      _controller.forward();
    }
  }

  void _onTapUp(TapUpDetails details) async {
    await _closeSnackBar();
  }

  void _onPanEnd(DragEndDetails details) async {
    await _closeSnackBar();
  }

  Future _closeSnackBar() async {
    if (mounted) {
      _controller.reverse();
      await Future.delayed(animationDuration);
      widget.onTap?.call();
    }
  }
}
class SafeAreaValues {
  const SafeAreaValues({
    this.left = true,
    this.right = true,
    this.top = true,
    this.bottom = true,
    this.minimum = EdgeInsets.zero,
    this.maintainBottomViewPadding = false,
  });

  final bool left;
  final bool top;
  final bool right;
  final bool bottom;
  final EdgeInsets minimum;
  final bool maintainBottomViewPadding;
}