//@dart=2.9
import 'package:ems/core/utilities/images.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/controller/AuthCubit.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/0_header_sign_in.dart';
import 'package:ems/PROJECT/1-Auth/SignUp/presentation/widget/1_body_sign_up.dart';
import 'package:ems/PROJECT/1-Auth/SignUp/presentation/widget/3_floater_signup.dart';
import 'package:ems/core/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: Scaffold(
          key: AuthCubit.get(context).scaffoldSignUpKey,
          body: SizedBox(
            width: SizeConfig.screenWidth,
            child: Stack(
              alignment: Alignment.center,
              children: [
                //   Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   children: [
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisSize: MainAxisSize.max,
                //       children: const [
                //         BlurBall(color: AppColors.main1,),
                //         BlurBall(color: AppColors.main2,),
                //       ],
                //     ),
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: const [
                //         BlurBall(color: AppColors.main3,),
                //         BlurBall(color: AppColors.main4,),
                //       ],
                //     )
                //   ],
                // ),

                Image.asset(Img.logo, fit: BoxFit.cover),
                BackdropFilter(
                  filter: ui.ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Container(
                    width: SizeConfig.screenWidth,
                    color: Colors.white.withOpacity(0.7),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          HeaderSignIn(),
                          BodySignUp(),
                          FloaterSignUp(),
                        ]),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
