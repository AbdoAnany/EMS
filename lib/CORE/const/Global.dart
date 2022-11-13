// @dart=2.9

import 'package:flutter/material.dart';

import 'device_type.dart';


class Global {
  static String userLogin;
  static String userOriginalName;
  static String token;
  static String jobEnglishName;
  static String errorDio;
  static String localAppVersion;
  static String newAppVersion;
  static String fireBaseToken;
  static DeviceInfo deviceInfo;
  static bool isRelease = false;
  static int userID = 0;

  // static bool isUploadAttach = false;
  static int isAdmin = 0;
  static int landingID = 0;
  static int indexScreen = 0;
  static  String appState = "";
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> fcmNavigatorKey = GlobalKey<NavigatorState>();
}
