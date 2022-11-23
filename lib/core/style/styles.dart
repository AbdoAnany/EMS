import 'package:flutter/material.dart';
import '../content.dart';

TextStyle textStyleHeader = const TextStyle(
    color: AppColors.main, fontWeight: FontWeight.bold, fontSize: 30,overflow: TextOverflow.ellipsis);
TextStyle textStyleHeaderLight = const TextStyle(
    color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 26,overflow: TextOverflow.ellipsis);
TextStyle textStyleHeaderLight20 = const TextStyle(
    color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 20,overflow: TextOverflow.ellipsis);
TextStyle textStyleHeaderMain20 = const TextStyle(
    color: AppColors.main, fontWeight: FontWeight.bold, fontSize: 20,overflow: TextOverflow.ellipsis,);
TextStyle textStyleHeaderMain16 = const TextStyle(
    color: AppColors.main, fontWeight: FontWeight.normal, fontSize: 16,overflow: TextOverflow.ellipsis, );
TextStyle textStyleHeaderLight16 = const TextStyle(
    color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 16,overflow: TextOverflow.ellipsis);



TextStyle textStyleLabel = const TextStyle(
    color: AppColors.main, fontWeight: FontWeight.bold, fontSize: 16);

TextStyle textStyleSubtitle = const TextStyle(
    color: AppColors.blueGrey, fontWeight: FontWeight.normal, fontSize: 14);
TextStyle textStyleUnderLine = const TextStyle(
    color: AppColors.blueGrey, fontWeight: FontWeight.normal, fontSize: 14,decoration: TextDecoration.underline);
TextStyle textStyleSubtitle12 = const TextStyle(
    color: AppColors.blueGrey, fontWeight: FontWeight.normal, fontSize: 12);
OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  gapPadding: 4,
  borderSide: const BorderSide(
    color: AppColors.main,
    width: 1
  ),
);
