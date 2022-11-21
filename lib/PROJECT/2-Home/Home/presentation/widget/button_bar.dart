//@dart=2.9

import 'package:ems/PROJECT/2-Home/Home/date/models/HomeButtonBar.dart';
import 'package:ems/PROJECT/2-Home/Home/date/models/HomeButtonBarModel.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeState.dart';
import 'package:ems/core/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/share/functions.dart';

class HomeButtonBar extends StatelessWidget{
 final HomeButtonBarModel homeTabBar;

  const HomeButtonBar({Key key, this.homeTabBar,}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<HomeCubit,HomeState>(
    bloc: HomeCubit(),
        builder: (e,s){
      print('HomeCubit');
        return       Container(
          width: 50,
          decoration: homeTabBar.selected? const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8),),
          ):null,
          padding: const EdgeInsets.all(8.0),
          margin:const EdgeInsets.fromLTRB(6,8,0,0),
          child: InkWell(onTap: homeTabBar.onPress,child:iconSvg(homeTabBar.name,isDark:  homeTabBar.selected)),
        );
      },);

  }

}