//@dart=2.9
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/controller/AuthCubit.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/controller/AuthState.dart';
import 'package:ems/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/content.dart';
import '../../../../../core/style/styles.dart';
import '../../date/models/MyTextFormFildModels.dart';

class CustomTextFormField extends StatelessWidget {
  MyTextFormFieldModels model;

  CustomTextFormField({Key key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) => Container(
              width: SizeConfig.screenWidth,
              height: 50,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: TextFormField(
                controller: model.controller,
                keyboardType: model.keyboardType ?? TextInputType.text,
                focusNode:model.focusNode,
                obscureText: model.label.toLowerCase() == 'password' && AuthCubit.isObscureText,
                decoration: InputDecoration(
                  border: outlineInputBorder,
                  errorBorder: outlineInputBorder,
                  enabledBorder: outlineInputBorder,
                  focusedBorder: outlineInputBorder,
                  labelStyle: textStyleLabel,
                  labelText: model.label,



                  suffixIcon: IconButton(
                    icon: Icon(model.label.toLowerCase() == 'password' && AuthCubit.isObscureText ?
                    Icons.visibility_off_outlined : model.icon, color: AppColors.main),
                    onPressed: () => AuthCubit.get(context).onChangeObscureText(model),
                  ),
                  hintText: model.hint,
                  hintStyle: textStyleSubtitle,
                ),
                maxLines: 1,
              ),
            ));
  }
}
