//@dart=2.9

import 'package:ems/PROJECT/1-Auth/SignIn/date/models/AllTextFormField.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/date/models/MyTextFormFildModels.dart';
import 'package:ems/core/content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  GlobalKey<ScaffoldState> scaffoldHomeKey = GlobalKey<ScaffoldState>();

  static HomeCubit get(context) => BlocProvider.of(context);



}
