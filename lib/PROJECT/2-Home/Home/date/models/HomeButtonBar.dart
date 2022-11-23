import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/core/utilities/enum.dart';
import 'package:ems/core/utilities/images.dart';

import 'HomeButtonBarModel.dart';

class HomeTabBar {
  static Map<HomeTab,HomeButtonBarModel> homeTabBar={

    HomeTab.home:HomeButtonBarModel(
      name: AppIcon.home,selected: false,
      onPress: ()=>HomeCubit.get(HomeCubit.scaffoldHomeKey.currentContext).changeHomeTab(HomeTab.home) ,),
    HomeTab.profile:HomeButtonBarModel(
      name: AppIcon.profile,selected: false,
      onPress: ()=>HomeCubit.get(HomeCubit.scaffoldHomeKey.currentContext).changeHomeTab(HomeTab.profile) ,),

  };

  // static HomeButtonBarModel home = HomeButtonBarModel(
  //   name: AppIcon.home,selected: false,
  //  onPress: ()=>HomeCubit.get(HomeCubit.scaffoldHomeKey.currentContext).changeHomeTab(HomeTab.home) ,
  //
  // );
  // static HomeButtonBarModel profile = HomeButtonBarModel(
  //   name: AppIcon.profile,selected:false,
  //   onPress: ()=>HomeCubit.get(HomeCubit.scaffoldHomeKey.currentContext).changeHomeTab(HomeTab.profile) ,
  //
  // );
}

