//@dart=2.9
import 'package:animate_do/animate_do.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/date/models/AllTextFormField.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/controller/AuthCubit.dart';
import 'package:ems/core/const/const.dart';
import 'package:ems/core/share/widget/my_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../../../../core/size_config.dart';
import '../../../../../core/style/styles.dart';
import '../../../../../core/widget/MainButton.dart';

class BodySignUp extends StatelessWidget {
  const BodySignUp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * .8,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              delay: const Duration(milliseconds: 500),
              child: ListTile(
                title: Text(AppString.signUp, style: textStyleHeader),
                subtitle: Text(AppString.signUpHint, style: textStyleSubtitle),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 700),
              child: CustomTextFormField(
                model: MyTextFormField.userName,
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 700),
              child: CustomTextFormField(
                model: MyTextFormField.email,
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: CustomTextFormField(
                model: MyTextFormField.password,
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: CustomTextFormField(
                model: MyTextFormField.passwordConfirm,
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 800),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppString.forgetPassword,
                    style: textStyleUnderLine,
                  )),
            ),

            const SizedBox(
              height: 100,
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 1000),
              child: MainButton(
                title: AppString.signUp,
                onPressed: () => AuthCubit.get(context).onSignIn(),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            // FadeInDown(
            //   delay: const Duration(milliseconds: 1000),
            //   child: MainButton(
            //     title: 'Sign Up',
            //     onPressed: () => AuthCubit.get(context).onSignIn(),
            //     isWhite: true,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
