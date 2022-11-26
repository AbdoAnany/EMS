//@dart=2.9
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/controller/AuthCubit.dart';
import 'package:ems/PROJECT/1-Auth/SignIn/presentation/sign_in_screen.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/home_screen.dart';
import 'package:ems/PROJECT/2-Home/User/presentation/controller/UserCubit.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'core/const/const.dart';
import 'PROJECT/0-Starting/1-Splash/presentation/splash_screen.dart';

// https://zeracreative.com/products/school-management-system-software-karachi-pak/
void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(
        create: (context) => AuthCubit()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => UserCubit()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      // builder: (context, child) => ResponsiveWrapper.builder(
      //     BouncingScrollWrapper.builder(context, child),
      //     maxWidth: 2460,
      //     minWidth: 450,
      //     defaultScale: true,
      //     breakpoints: [
      //       const ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE),
      //       const ResponsiveBreakpoint.autoScaleDown(800, name: TABLET),
      //       const ResponsiveBreakpoint.autoScaleDown(1100, name: TABLET),
      //       const ResponsiveBreakpoint.autoScaleDown(1200, name: DESKTOP),
      //       const ResponsiveBreakpoint.autoScaleDown(1400, name: DESKTOP),
      //       const ResponsiveBreakpoint.autoScaleDown(1600, name: DESKTOP),
      //       const ResponsiveBreakpoint.autoScaleDown(2460, name: "4K"),
      //
      //     ],

      //   ),
      theme: ThemeData(

        primaryColor:AppColors.main,
        //   textTheme: GoogleFonts.abhayaLibreTextTheme()
          //    textTheme: GoogleFonts.fredokaTextTheme()
      //  textTheme: GoogleFonts.solwayTextTheme()
        textTheme: GoogleFonts.cairoTextTheme()
      ),
      home:  const HomeScreen(),
    ));
  }
}

