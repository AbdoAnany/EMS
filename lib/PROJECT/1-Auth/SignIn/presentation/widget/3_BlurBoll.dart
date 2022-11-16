//@dart=2.9
import 'package:flutter/material.dart';
import '../../../../../core/size_config.dart';

class BlurBall extends StatelessWidget {
  const BlurBall({Key key, this.color}) : super(key: key);
final color;
  @override
  Widget build(BuildContext context) {
    return   Expanded(
      child: Container(
        margin: const EdgeInsets.all(20.0),
   width: SizeConfig.screenWidth*.4,height: SizeConfig.screenHeight*.4,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            //  color: AppColors.white,
            boxShadow: [
              BoxShadow(
                  color:color ,
                  blurRadius: 100,
                  spreadRadius: 5)
            ]),

      ),
    );
  }
}
