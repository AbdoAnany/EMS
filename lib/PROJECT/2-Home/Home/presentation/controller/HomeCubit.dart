//@dart=2.9
import 'package:ems/PROJECT/2-Home/Home/date/models/HomeButtonBar.dart';
import 'package:ems/core/utilities/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static GlobalKey<ScaffoldState> scaffoldHomeKey = GlobalKey<ScaffoldState>();

  static HomeCubit get(context) => BlocProvider.of(context);
   HomeTab selectedHomeTab=HomeTab.home;



  changeHomeTab(HomeTab newTab){
    selectedHomeTab=newTab;
    HomeTabBar.homeTabBar[newTab]. selected=true;
   // HomeTabBar.home
    emit(ChangeHomeTab());


  }




}
