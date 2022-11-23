//@dart=2.9

import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/core/size_config.dart';
import 'package:ems/core/style/styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: SizeConfig.screenWidth - (HomeCubit.isHomeBarExpanded ? HomeCubit.barMax : HomeCubit.barMin),
      height: SizeConfig.screenHeight,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text('Welcome In Home Screen',
              style: textStyleHeader,
            )
          ]),
    );
  }
}
