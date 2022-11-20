//@dart=2.9

import 'package:ems/PROJECT/1-Auth/SignIn/date/models/AllTextFormField.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/date/models/MyTextFormFildModels.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/home_screen.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/share/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'AuthState.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  GlobalKey<ScaffoldState> scaffoldSignInKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> scaffoldSignUpKey = GlobalKey<ScaffoldState>();

  static AuthCubit get(context) => BlocProvider.of(context);
  static bool isObscureText = false;

  onChangeObscureText(model) {
    if (model.label.toLowerCase() == 'password') {
      isObscureText = !isObscureText;
      print('password');
      print(isObscureText);
      emit(AuthChangObscureTextState());
    }
  }

  onSignIn() {
    print('11111');
    print(MyTextFormField.email.controller.text);
    print(MyTextFormField.password.controller.text);
    navigatorTo(context:scaffoldSignInKey.currentContext,page: const HomeScreen() );
    emit(AuthChangObscureTextState());
  }
}
