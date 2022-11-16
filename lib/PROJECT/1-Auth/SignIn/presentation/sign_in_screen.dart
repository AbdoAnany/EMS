//@dart=2.9
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/controller/AuthCubit.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/0_header_sign_in.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/1_body_sign_in.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/widget/3_BlurBoll.dart';
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
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      BlurBall(
                        color: AppColors.main1,
                      ),
                      BlurBall(
                        color: AppColors.main2,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      BlurBall(
                        color: AppColors.main3,
                      ),
                      BlurBall(
                        color: AppColors.main4,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: BlurryContainer(
                  color: Colors.white.withOpacity(0.7),
                  blur: 10,
                  elevation: 10,
                  padding: const EdgeInsets.all(8),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  width: SizeConfig.screenWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                    const HeaderSignIn(),
                    const BodySignIn(),

                  ]),
                ),
              ),
            ],
          )),
    );
  }
}
