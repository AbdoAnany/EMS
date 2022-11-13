// @dart=2.9
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';

import '../../Const/Global.dart';


class DioHelper {
  static Dio _dio;

  static intit() {
    _dio = Dio(
      BaseOptions(
          baseUrl:   '', // URLS.BaseURL,
          receiveDataWhenStatusError: true,
          connectTimeout: 60 * 1000,
          receiveTimeout: 60 * 1000),
    );
  }


  @override
  Future<List<dynamic>> postData({
    String url,
    dynamic data,
    String token,
    String storeProucderName,
  }) async {

    Response response;
    if (token != null) {
      String tokenByBarren = "Bearer " + token;
      if (storeProucderName != null) {
        _dio.options.headers = {
          'Authorization': tokenByBarren,
          'SP_Name': storeProucderName
        };
      } else {
        _dio.options.headers = {
          'Authorization': tokenByBarren,
        };
      }
    } else {
      if (storeProucderName != null) {
        _dio.options.headers = {
          'SP_Name': storeProucderName,
        };
      }
    }

    try {
      response = await _dio.post(url, data: data);
      List<Map<String, Object>> list = [];

      list.add(response.data);
      try{
        var newMap = groupBy(response.data, (Map obj) => obj['SubjectID']);
        // print(newMap);
      }
      catch(e){

      }
      return list;
    } on DioError catch (e) {
      if (e.response != null) {
        // print(e.response);
        print(
            '===================================================$url=======================================================');
        print('Dio erorr!');
        print(_dio.options.headers);
        print('Status:${e.response?.statusCode}');
        print('Data:${e.response?.data}');
        print('Headers:${e.response?.headers}');
      } else {
        Global.errorDio = e.message;
        return null;
      }
    }
  }

  // Future<List<dynamic>> loginPostData({
  //   String url,
  //   dynamic data,
  //   String token,
  //   String storeProucderName,
  // }) async {
  //   Response response;
  //   if (token != null) {
  //     String tokenByBarren = "Bearer " + token;
  //     if (storeProucderName != null) {
  //       _dio.options.headers = {
  //         'Authorization': tokenByBarren,
  //         'SP_Name': storeProucderName
  //       };
  //     } else {
  //       _dio.options.headers = {
  //         'Authorization': tokenByBarren,
  //       };
  //     }
  //   } else {
  //     if (storeProucderName != null) {
  //       _dio.options.headers = {
  //         'SP_Name': storeProucderName,
  //       };
  //     }
  //   }
  //
  //   try {
  //     response = await Dio(
  //       BaseOptions(
  //           baseUrl: URLS.BaseURL,
  //           receiveDataWhenStatusError: true,
  //           connectTimeout: 60 * 1000,
  //           receiveTimeout: 60 * 1000),
  //     ).post(url, data: data);
  //     List<Map<String, Object>> list = [];
  //
  //     list.add(response.data);
  //     try{
  //       var newMap = groupBy(response.data, (Map obj) => obj['SubjectID']);
  //       // print(newMap);
  //     }
  //     catch(e){
  //
  //     }
  //     return list;
  //   } on DioError catch (e) {
  //     if (e.response != null) {
  //       // print(e.response);
  //       print(
  //           '===================================================$url=======================================================');
  //       print('Dio erorr!');
  //       print(_dio.options.headers);
  //       print('Status:${e.response?.statusCode}');
  //       print('Data:${e.response?.data}');
  //       print('Headers:${e.response?.headers}');
  //     } else {
  //       Global.errorDio = e.message;
  //       return null;
  //     }
  //   }
  // }
  //

}
