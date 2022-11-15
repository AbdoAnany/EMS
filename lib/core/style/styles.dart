import 'package:flutter/material.dart';
import '../content.dart';

TextStyle textStyleHeader = const TextStyle(
    color: AppColors.main, fontWeight: FontWeight.bold, fontSize: 30);
TextStyle textStyleHeaderLight = const TextStyle(
    color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 20);
TextStyle textStyleHeaderMain = const TextStyle(
    color: AppColors.main, fontWeight: FontWeight.normal, fontSize: 20);



TextStyle textStyleLabel = const TextStyle(
    color: AppColors.main, fontWeight: FontWeight.bold, fontSize: 16);

TextStyle textStyleSubtitle = const TextStyle(
    color: AppColors.blueGrey, fontWeight: FontWeight.normal, fontSize: 14);
TextStyle textStyleUnderLine = const TextStyle(
    color: AppColors.blueGrey, fontWeight: FontWeight.normal, fontSize: 14,decoration: TextDecoration.underline);

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  gapPadding: 4,
  borderSide: const BorderSide(
    color: AppColors.main,
    width: 1
  ),
);
