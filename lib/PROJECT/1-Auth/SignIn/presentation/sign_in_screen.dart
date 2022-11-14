//@dart=2.9
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/controller/AuthCubit.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/0_header_sign_in.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/1_body_sign_in.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/size_config.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: Scaffold(
          key: AuthCubit.get(context).scaffoldSignInKey,
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: AppColors.silverColors)),
            padding: const EdgeInsets.all(20.0),
            child: BlurryContainer(
              color: Colors.white.withOpacity(0.7),
              blur: 10,
              elevation: 10,
              padding: const EdgeInsets.all(8),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              width: SizeConfig.screenWidth,
              child: Column(
                  children: const [
                    HeaderSignIn(),
                    BodySignIn(),
              ]),
            ),
          )),
    );
  }
}
