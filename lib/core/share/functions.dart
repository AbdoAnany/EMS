


import 'package:flutter/material.dart';

navigatorTo({context, page}){
  Navigator.push(
      context,
      PageRouteBuilder(
        transitionsBuilder:
            (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeIn;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(
            curve: curve,
          ));

          return SlideTransition(
              position: animation.drive(tween), child: child);
        },
        transitionDuration: const Duration(milliseconds: 700),
        reverseTransitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) =>
        page,
      ));
}


navigatorAndReplaceTo({context, page}){
  Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionsBuilder:
            (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeIn;
          var tween = Tween(begin: begin, end: end).chain(CurveTween(
            curve: curve,
          ));

          return SlideTransition(
              position: animation.drive(tween), child: child);
        },
        transitionDuration: Duration(milliseconds: 700),
        reverseTransitionDuration: Duration(milliseconds: 700),
        pageBuilder: (context, animation, secondaryAnimation) =>
        page,
      ));
}