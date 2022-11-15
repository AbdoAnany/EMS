//@dart=2.9
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/controller/AuthCubit.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/0_header_sign_in.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/1_body_sign_in.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/size_config.dart';
import 'package:ems/core/style/styles.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return SafeArea(
      child: Scaffold(
          key: AuthCubit.get(context).scaffoldSignInKey,
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [Row(
                  children: [

                    Container(
                      width: SizeConfig.screenWidth*.5,height: SizeConfig.screenHeight*.5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //  color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.main1.withOpacity(1),
                                blurRadius: 100,
                                spreadRadius: 5)
                          ]),
                      padding: const EdgeInsets.all(20.0),
                    ),
                    Container(
                      width: SizeConfig.screenWidth*.5,height: SizeConfig.screenHeight*.5,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          //  color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.main2.withOpacity(1),
                                blurRadius: 100,
                                spreadRadius: 5)
                          ]),
                      padding: const EdgeInsets.all(20.0),
                    ),
                  ],
                ),
                  Row(
                    children: [

                      Container(
                        width: SizeConfig.screenWidth*.5,height: SizeConfig.screenHeight*.5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //  color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.main3.withOpacity(1),
                                  blurRadius: 100,
                                  spreadRadius: 5)
                            ]),
                        padding: const EdgeInsets.all(20.0),
                      ),
                      Container(
                        width: SizeConfig.screenWidth*.5,height: SizeConfig.screenHeight*.5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //  color: AppColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.main4.withOpacity(1),
                                  blurRadius: 100,
                                  spreadRadius: 5)
                            ]),
                        padding: const EdgeInsets.all(20.0),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BlurryContainer(
                  color: Colors.white.withOpacity(0.7),
                  blur: 10,
                  elevation: 10,
                  padding: const EdgeInsets.all(8),

                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  width: SizeConfig.screenWidth,
                  child: Column(children: [
                    const HeaderSignIn(),
                    const BodySignIn(),
                    Text(
                      'Or SignIn ',
                      style: textStyleHeaderMain,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image.asset('assets/images/facebook.png',
                            width: 50, height: 50),
                        SizedBox(
                          width: 40,
                        ),
                        Image.asset('assets/images/google.png',
                            width: 50, height: 50),
                      ],
                    )
                  ]),
                ),
              ),
            ],
          )),
    );
  }
}
