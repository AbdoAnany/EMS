//@dart=2.9
import 'package:animate_do/animate_do.dart';
import 'package:ems/PROJECT/1-Auth/SignUp/presentation/sign_up_screen.dart';
import 'package:ems/core/share/functions.dart';
import 'package:flutter/material.dart';
import '../../../../../core/const/const.dart';
import '../../../../../core/style/styles.dart';

class FloaterSignIn extends StatelessWidget {
  const FloaterSignIn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInDown(
            delay: const Duration(milliseconds: 500),
            child: Text(AppString.noAccount, style: textStyleSubtitle12)),
        FadeInDown(
            delay: const Duration(milliseconds: 500),
            child: TextButton(
              child: Text(' ${AppString.createAccount}',
                  style: textStyleHeaderMain16),
              onPressed: () => navigatorAndReplaceTo(
                  context: context, page: const SignUpScreen()),
            )),
      ],
    );
  }
}
