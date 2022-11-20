//@dart=2.9
import 'package:flutter/cupertino.dart';

import '../../domain/entites/MyTextFormFieldEntities.dart';

class MyTextFormFieldModels extends MyTextFormFieldEntities {
  MyTextFormFieldModels(
      {icon,
      controller,
      hint,
      focusNode,
      label,
      keyboardType = TextInputType.text,
      obscureText = false})
      : super(
          icon: icon,
          controller: controller,
          hint: hint,
          label: label,
          focusNode: focusNode,
          keyboardType: keyboardType,
        );
}
