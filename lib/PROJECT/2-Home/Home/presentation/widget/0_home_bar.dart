//@dart=2.9

import 'package:ems/PROJECT/2-Home/Home/date/models/HomeButtonBar.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/widget/button_bar.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/size_config.dart';
import 'package:ems/core/utilities/enum.dart';
import 'package:flutter/cupertino.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      width: HomeCubit.isHomeBarExpanded ? HomeCubit.barMax : HomeCubit.barMin,
      height: SizeConfig.screenHeight,
      //   margin: const EdgeInsets.symmetric(vertical: 40),
      decoration: const BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
          boxShadow: [BoxShadow(color: AppColors.gray1,offset: Offset( 4, 4),blurRadius: 8)]
      ),
      duration: const Duration(milliseconds: 300),
      child: ListView(
        shrinkWrap: true,
        children: [
          HomeButtonBar(homeTabBar: HomeTabBar.homeTabBar[HomeTab.home]),
          HomeButtonBar(homeTabBar: HomeTabBar.homeTabBar[HomeTab.profile]),
        ],
      ),
    );
  }
}
