//@dart=2.9
import 'package:ems/PROJECT/0-Starting/1-Splash/presentation/screen/splash_mobile_screen.dart';
import 'package:ems/PROJECT/0-Starting/1-Splash/presentation/screen/splash_tablet_screen.dart';
import 'package:ems/PROJECT/0-Starting/1-Splash/presentation/screen/splash_web_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: ((context, constraints) {
        print(constraints);
        if (constraints.maxWidth > 800) {
          // desktop
          return const SplashWebScreen();
        } else if (constraints.maxWidth > 500) {
          // tablet
          return const SplashTabletScreen();
        } else {
          // Mobile
          return const SplashMobileScreen();
        }

      }),
    ));
  }
}
