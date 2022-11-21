//@dart=2.9
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:ems/PROJECT/2-Home/Home/date/models/HomeButtonBar.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeState.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/widget/button_bar.dart';
import 'package:ems/core/utilities/enum.dart';
import 'package:ems/core/utilities/images.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/controller/AuthCubit.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/0_header_sign_in.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/1_body_sign_in.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/3_floater_sign_in.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/size_config.dart';
import 'package:ems/core/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;

import '../../../../core/share/functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocConsumer<HomeCubit,HomeState>(builder: (e,s){
      return  SafeArea(
        child: Scaffold(
            key: HomeCubit.scaffoldHomeKey,
            body: WillPopScope(
              onWillPop: () {
                return Future.value(true);
              },
              child: Container(
                color: AppColors.white,
                width: SizeConfig.screenWidth,
                child: Row(
                  children: [
                    Container(
                      width: 50,height: double.infinity,
                      //   margin: const EdgeInsets.symmetric(vertical: 40),

                      decoration: const BoxDecoration(
                        color: AppColors.blueGrey,
                        //  borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                        //  boxShadow: [BoxShadow(color: AppColors.gray1,offset: Offset( 4, 4),blurRadius: 8)]
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          HomeButtonBar(homeTabBar: HomeTabBar.home),
                          HomeButtonBar(homeTabBar: HomeTabBar.profile) ,
                          // HomeButtonBar(iconPath: AppIcon.profile,isDark: HomeCubit.selectedHomeTab==HomeTab.profile,
                          //     onTap:()=>HomeCubit.get(context).changeHomeTab(HomeTab.profile)),
                          //
                          // HomeButtonBar(iconPath: AppIcon.activity,isDark: HomeCubit.selectedHomeTab==HomeTab.activity),
                          // HomeButtonBar(iconPath: AppIcon.calendar,isDark: HomeCubit.selectedHomeTab==HomeTab.calendar),
                          // HomeButtonBar(iconPath: AppIcon.heart,isDark: HomeCubit.selectedHomeTab==HomeTab.heart),
                          // HomeButtonBar(iconPath: AppIcon.chat,isDark: HomeCubit.selectedHomeTab==HomeTab.chat),
                          // HomeButtonBar(iconPath: AppIcon.category,isDark: HomeCubit.selectedHomeTab==HomeTab.category),
                          //  HomeButtonBar(iconPath: AppIcon.logOut,isDark: HomeCubit.selectedHomeTab==HomeTab.logout),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: SizeConfig.screenWidth,
                        //   child: BackdropFilter(
                        //     filter: ui.ImageFilter.blur(
                        //       sigmaX: 5,
                        //       sigmaY: 5,
                        //     ),
                        //     child:Column(
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           'Welcome In Home Screen',
                        //           style: textStyleHeader,
                        //         )
                        //       ]),
                        // ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      );
    }, listener: (e,s){});
  }
}