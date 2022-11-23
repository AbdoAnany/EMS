//@dart=2.9
import 'package:ems/PROJECT/2-Home/Home/date/models/HomeButtonBar.dart';
import 'package:ems/core/utilities/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(HomeInitialState());

  static GlobalKey<ScaffoldState> scaffoldHomeKey = GlobalKey<ScaffoldState>();
  static double barMax=200;
  static double barMin=60;
  static HomeCubit get(context) => BlocProvider.of(context);
  static bool isHomeBarExpanded=true;

  changeHomeTab(HomeTab newTab){
    if( HomeTabBar.homeTabBar[newTab].selected){
      doHomeBarExpanded();
    }else {
      HomeTabBar.homeTabBar.forEach((key, value) =>  value.homeTab==newTab?value.selected=true: value.selected=false);
    }
    emit(ChangeHomeTab());
  }
  doHomeBarExpanded(){
    isHomeBarExpanded=!isHomeBarExpanded;
    //emit(ChangeHomeTab());
  }




}
