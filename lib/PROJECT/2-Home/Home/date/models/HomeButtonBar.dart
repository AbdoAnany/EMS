import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/core/const/const.dart';
import 'package:ems/core/utilities/enum.dart';
import 'package:ems/core/utilities/images.dart';
import 'package:flutter/material.dart';

import 'HomeButtonBarModel.dart';

class HomeTabBar {
  static HomeButtonBarModel home = HomeButtonBarModel(
    name: AppIcon.home,selected: HomeCubit.selectedHomeTab==HomeTab.home,
   onPress: ()=>HomeCubit.get(HomeCubit.scaffoldHomeKey.currentContext).changeHomeTab(HomeTab.home) ,

  );
  static HomeButtonBarModel profile = HomeButtonBarModel(
    name: AppIcon.profile,selected: HomeCubit.selectedHomeTab==HomeTab.profile,
    onPress: ()=>HomeCubit.get(HomeCubit.scaffoldHomeKey.currentContext).changeHomeTab(HomeTab.profile) ,

  );
}

