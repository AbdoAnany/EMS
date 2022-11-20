import 'package:ems/core/const/const.dart';
import 'package:flutter/material.dart';

import 'MyTextFormFildModels.dart';

class MyTextFormField {
  static MyTextFormFieldModels userName = MyTextFormFieldModels(
    label: AppString.userName,
    hint: AppString.userNameHint,
    controller: TextEditingController(),
    icon: Icons.person,
    focusNode: FocusNode(),
    keyboardType: TextInputType.emailAddress,
  );
  static MyTextFormFieldModels email = MyTextFormFieldModels(
    label: AppString.email,
    hint: AppString.emailHint,
    controller: TextEditingController(),
    icon: Icons.email,
    focusNode: FocusNode(),
    keyboardType: TextInputType.emailAddress,
  );
  static MyTextFormFieldModels password = MyTextFormFieldModels(
    label: AppString.password,
    hint: AppString.passwordHint,
    controller: TextEditingController(),
    focusNode: FocusNode(),
    icon: Icons.visibility_outlined,
  );
  static MyTextFormFieldModels passwordConfirm = MyTextFormFieldModels(
    label: AppString.passwordConfirm,
    hint: AppString.passwordConfirmHint,
    controller: TextEditingController(),
    focusNode: FocusNode(),
    icon: Icons.visibility_outlined,
  );
}
