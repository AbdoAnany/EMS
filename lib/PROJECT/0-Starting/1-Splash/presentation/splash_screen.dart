//@dart=2.9
import 'package:ems/PROJECT/0-Starting/1-Splash/presentation/screen/splash_mobile_screen.dart';
import 'package:ems/PROJECT/0-Starting/1-Splash/presentation/screen/splash_tablet_screen.dart';
import 'package:ems/PROJECT/0-Starting/1-Splash/presentation/screen/splash_web_screen.dart';
import 'package:ems/core/const/const.dart';
import 'package:flutter/material.dart';

import '../../../../CORE/utilities/images.dart';
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
        print('111111111111111111111111111');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const SignInScreen()),
                (r) => true);

    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
          Hero(tag: Img.logo, child:   FadeInImage(
              width: 150,
              height: 150,
              excludeFromSemantics: true,
              repeat: ImageRepeat.repeat,imageSemanticLabel: Global.appName,
           //   fadeOutDuration:const Duration(milliseconds: 1000),
              fadeInDuration: const Duration(milliseconds: 2000),
              placeholder: AssetImage(Img.logo),
              image: AssetImage(Img.logo)),
            ),
              Text(Global.appName,),
          ]),
    ));
  }
}
