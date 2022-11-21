//@dart=2.9
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:ems/core/utilities/images.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/controller/AuthCubit.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/0_header_sign_in.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/1_body_sign_in.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/3_floater_sign_in.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/size_config.dart';
import 'package:ems/core/style/styles.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: Scaffold(
          key: AuthCubit.get(context).scaffoldSignInKey,
          body: WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: SizedBox(
              width: SizeConfig.screenWidth,
              child: SingleChildScrollView(
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
                              BodySignIn(),
                              FloaterSignIn(),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
