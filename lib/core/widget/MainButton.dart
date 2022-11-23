//@dart=2.9

import 'package:flutter/material.dart';

import '../content.dart';
import '../size_config.dart';
import '../style/styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key key, this.title, this.onPressed, this.isWhite = false})
      : super(key: key);
  final String title;
  final Function() onPressed;
  final bool isWhite;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isWhite?AppColors.white:AppColors.main,
        border:isWhite?  Border.all(color: AppColors.main, width:  1 ):
        Border.all(color: AppColors.main, width:  0 ),
      boxShadow: const [BoxShadow(color: AppColors.gray1,blurRadius: 16,offset: Offset(0, 16))]
      ),


      child: MaterialButton(

        minWidth: SizeConfig.screenWidth,
        height: 50,
        onPressed: onPressed,
        child: Text(title, style:isWhite? textStyleHeaderMain20:textStyleHeaderLight),
      ),
    );
  }
}
