//@dart=2.9


import 'package:ems/core/utilities/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static GlobalKey<ScaffoldState> scaffoldHomeKey = GlobalKey<ScaffoldState>();

  static HomeCubit get(context) => BlocProvider.of(context);
  static HomeTab selectedHomeTab=HomeTab.home;



  changeHomeTab(HomeTab newTab){
    selectedHomeTab=newTab;
    emit(ChangeHomeTab());
    print(selectedHomeTab.name);

  }



}
