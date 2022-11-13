
//@dart=2.9
import 'package:flutter/material.dart';

class LayoutPlatform extends StatelessWidget {
  const LayoutPlatform({Key key, this.platform, this.child}) : super(key: key);
  final platform;
  final child;


  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(builder: ((context, constraints) {
      print(constraints);
      if (constraints.maxWidth > 1400 ){
        //desktop
        return child;
      }
      else if (constraints.maxWidth > 1200) {
        //desktop
        return child;
      } else if (constraints.maxWidth > 1100) {
        //desktop
        return child;
      }
      else if (constraints.maxWidth > 800) {
        //tablet
        return child;
      }
      else if (constraints.maxWidth > 600) {
        //tablet
        return child;
      }
      else if (constraints.maxWidth > 450) {
        //mobile
        return child;
      }
      else {
        //mobile
        return child;
      }



    })


    );
  }
}
