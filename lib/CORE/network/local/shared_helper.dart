// // @dart=2.9
// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
//
//
// class CachHelper {
//   static SharedPreferences sharedPreferences;
//   static final wightDivice = "wightDivice";
//   static final hightDivice = "hightDivice";
//   static final Language = "Language";
//   static final trackingMaxID = 0;
//
//   static init() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//  //    await createDB();
//   }
//
//   static Future<bool> setTrackingMaxID({
//     String key ='trackingMaxID',
//     @required dynamic value,
//   }) async {
//     if (value is double) {
//       return await sharedPreferences.setDouble(key, value);
//     } else if (value is String) {
//       return await sharedPreferences.setString(key, value);
//     } else if (value is int) {
//       return await sharedPreferences.setInt(key, value);
//     }
//     return await sharedPreferences.setBool(key, value);
//   }
//   static dynamic getTrackingMaxID({@required String key}) {
//     return sharedPreferences.get(key);
//   }
//
//   static Future<bool> SetData({
//     @required String key,
//     @required dynamic value,
//   }) async {
//     if (value is double) {
//       return await sharedPreferences.setDouble(key, value);
//     } else if (value is String) {
//       return await sharedPreferences.setString(key, value);
//     } else if (value is int) {
//       return await sharedPreferences.setInt(key, value);
//     }
//     return await sharedPreferences.setBool(key, value);
//   }
//
//   static Future<bool> remove({
//     @required String key,
//   }) async {
//     sharedPreferences.remove(key);
//   }
//
//   static dynamic GetData({@required String key}) {
//     return sharedPreferences.get(key);
//   }
// }
