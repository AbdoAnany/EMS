

import 'package:flutter/material.dart';

import 'MyTextFormFildModels.dart';

class MyTextFormField{
  static MyTextFormFieldModels email = MyTextFormFieldModels(
    label: "Email",
    hint: "enter your email",
    controller: TextEditingController(),
    icon: Icons.email,
    focusNode: FocusNode(),
    keyboardType: TextInputType.emailAddress,
  );
  static MyTextFormFieldModels password = MyTextFormFieldModels(
    label: "Password",
    hint: "enter your password",
    controller: TextEditingController(),
    focusNode: FocusNode(),
    icon: Icons.visibility_outlined,
  );
}
