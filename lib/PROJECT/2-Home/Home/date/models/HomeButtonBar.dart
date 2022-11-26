import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/core/utilities/enum.dart';
import 'package:ems/core/utilities/images.dart';

import 'HomeButtonBarModel.dart';

class HomeTabBar {
  static Map<HomeTab,HomeButtonBarModel> homeTabBar={

    HomeTab.Home:HomeButtonBarModel(
      icon: AppIcon.home,selected: true,
      homeTab: HomeTab.Home,
      onPress: ()=>HomeCubit.get(HomeCubit.scaffoldHomeKey.currentContext).changeHomeTab(HomeTab.Home) ,),
    HomeTab.Profile:HomeButtonBarModel(
      icon: AppIcon.profile,selected: false,
      homeTab: HomeTab.Profile,
      onPress: ()=>HomeCubit.get(HomeCubit.scaffoldHomeKey.currentContext).changeHomeTab(HomeTab.Profile) ,),

  };


}

