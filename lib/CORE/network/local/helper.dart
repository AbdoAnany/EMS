// @dart=2.9

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../../Const/Global.dart';
import '../../Const/device_type.dart';
import 'package:intl/intl.dart' as intl;

Future<void> writeToFile(ByteData data, String path) {
  final buffer = data.buffer;
  return new File(path)
      .writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

void NavigatTo(context, widget) {
  Navigator.push(context,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // const begin = Offset(0.0,.5);
          // const end = Offset.zero;
          // const curve = Curves.easeIn;
          // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return FadeTransition(
            opacity:  animation,
            child: child,);
        },
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (context, animation, secondaryAnimation) =>
         widget,
      ));
}
bool deviceIsMobile() {
return  Global.deviceInfo.deviceType == DeviceType.mobile;
}





onTime(text){
  return  text.split("T").first ==
      '${DateTime.now().year}-0${DateTime.now().month}-${DateTime.now().day}'
      ? 'To Day'
      : text.split("T").first ==
      '${DateTime.now().year}-${intl.NumberFormat('00').format(DateTime.now().month)}-${DateTime.now().day - 1}'
      ? 'yesterday'
      : text.split("T").first;
}
onAgo(int text){

  int hour=  text~/60;
  int minute=  text%59;
  int day =hour~/23;
  if(text<=1) {
    return 'now';
  }
  if(day>0)
  {
    hour=hour -day*23;
    return("${day}d ${hour}h ${minute}m"+' '+'ago');
  }
  else if(day<=0&&hour>0)
  {

    return("${hour}h ${minute}m"+' '+'ago');
  }
  else if(day<=0&&hour<=0)
  {

    return("${text}m"+' '+'ago');
  }
  return '';
}

void NavigatToAndReplace(context, widget) {

  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false);

}

String DateFormate({
  String dateFormate = "yyyy-MM-dd",
  @required String dateTime,
}) {
  try {
    return dateFormate =
        intl.DateFormat(dateFormate).format(DateTime.parse(dateTime)).toString();
  } catch (e) {
    return dateTime;
  }
}

List<String> cardColor = [
  "#5EB6E4",
  "#A24DC2",
  "#CF0072",
  "#6ABE2B",
  "#FB7545",
  "#5B1F69",
  "#5EB6E4",
  "#355C7D"
];
