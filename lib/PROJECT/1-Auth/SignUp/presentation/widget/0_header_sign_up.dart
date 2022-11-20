//@dart=2.9
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../../../core/const/const.dart';
import '../../../../../core/style/styles.dart';
import '../../../../../core/utilities/images.dart';

class HeaderSignUp extends StatelessWidget {
  const HeaderSignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInUp(
            delay: const Duration(milliseconds: 500),
            child: Image.asset(
              Img.logo,
              height: 100,
              width: 100,
            )),
        FadeInDown(
            delay: const Duration(milliseconds: 500),
            child: Text(AppString.appName, style: textStyleHeader)),
        FadeInDown(
            delay: const Duration(milliseconds: 500),
            child: Text(AppString.slogan, style: textStyleSubtitle)),
      ],
    );
  }
}
