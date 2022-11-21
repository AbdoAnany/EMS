//@dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/share/functions.dart';

class HomeButtonBar extends StatelessWidget{
final String iconPath;
final Function onTap;
final bool isDark;

  const HomeButtonBar({Key key, this.iconPath, this.onTap, this.isDark=false}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return   Container(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(onTap: onTap,child:iconSvg(iconPath,isDark: isDark)),
    );
  }

}