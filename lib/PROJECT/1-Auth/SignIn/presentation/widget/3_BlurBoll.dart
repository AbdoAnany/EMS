//@dart=2.9
import 'package:flutter/material.dart';
import '../../../../../core/size_config.dart';

class BlurBall extends StatelessWidget {
  const BlurBall({Key key, this.color}) : super(key: key);
final color;
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: SizeConfig.screenWidth*.5,height: SizeConfig.screenHeight*.5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          //  color: AppColors.white,
          boxShadow: [
            BoxShadow(
                color:color ,
                blurRadius: 100,
                spreadRadius: 5)
          ]),
      padding: const EdgeInsets.all(20.0),
    );
  }
}
