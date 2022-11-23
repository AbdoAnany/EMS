import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/core/utilities/enum.dart';
import 'package:ems/core/utilities/images.dart';

import 'HomeButtonBarModel.dart';

class HomeTabBar {
  static Map<HomeTab,HomeButtonBarModel> homeTabBar={

    HomeTab.home:HomeButtonBarModel(
      icon: AppIcon.home,selected: false,
      homeTab: HomeTab.home,
      onPress: ()=>HomeCubit.get(HomeCubit.scaffoldHomeKey.currentContext).changeHomeTab(HomeTab.home) ,),
    HomeTab.profile:HomeButtonBarModel(
      icon: AppIcon.profile,selected: false,
      homeTab: HomeTab.profile,
      onPress: ()=>HomeCubit.get(HomeCubit.scaffoldHomeKey.currentContext).changeHomeTab(HomeTab.profile) ,),

  };


}

