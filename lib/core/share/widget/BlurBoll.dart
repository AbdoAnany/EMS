//@dart=2.9
import 'package:flutter/material.dart';
import '../../size_config.dart';

class BlurBall extends StatelessWidget {
  const BlurBall({Key key, this.color}) : super(key: key);
final color;
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: const EdgeInsets.all(0.0),
      width:SizeConfig.screenWidth*.5,height: SizeConfig.screenHeight*.5,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          //  color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color:color ,
                blurRadius: 100,
                spreadRadius: 5)
          ]),

    );
  }
}
