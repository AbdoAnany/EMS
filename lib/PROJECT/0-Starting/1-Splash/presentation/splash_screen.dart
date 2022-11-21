//@dart=2.9
import 'package:ems/core/const/const.dart';
import 'package:ems/core/share/functions.dart';
import 'package:ems/core/size_config.dart';
import 'package:flutter/material.dart';
import '../../../../core/const/const.dart';
import '../../../../core/utilities/images.dart';
import '../../../1-Auth/SignIn/presentation/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000,),(){

        navigatorAndReplaceTo(context:context,page:const SignInScreen());

    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        body: Container(
      height: SizeConfig.screenHeight,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            FadeInImage(
                width: 150,
                height: 150,
                excludeFromSemantics: true,
                repeat: ImageRepeat.repeat,imageSemanticLabel: AppString.appName,
                //   fadeOutDuration:const Duration(milliseconds: 1000),
                fadeInDuration: const Duration(milliseconds: 2000),
                placeholder: AssetImage(Img.logo),
                image: AssetImage(Img.logo)),
              Text(AppString.appName,),
          ]),
    ));
  }
}
