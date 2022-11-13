import 'package:flutter/material.dart';
import '/core/size_config.dart';

const kTestColor2 = Color(0xFAb12341);

Color kPrimaryColor = AppColors.main;

const kPrimaryAmberColor = Color(0xFFFF8F00);
const kPrimaryRedColor = Color(0xFFd32d2e);
const kPrimaryGreenColor = Color(0xFF9db74d);
const kPrimaryBlueColor = Color(0xFF18a1ca);
Color secondaryDarkColor = HexColor('f09436');

const kGrayColor = Color(0xFFb1b1b1);
const kTextColor = Color(0xFF757575);
Color kDark = const Color(0xff000000);
Color kLight = const Color(0xffffffff);

Color backgroundColor = const Color(0xffe7e7e7);
Color secondaryLightColor = const Color(0xffffffff);
Color textDarkColor = const Color(0xff333333);
Color grayColor = const Color(0xffeae1e1);

double reSize(fontSize) {
  return (fontSize / 400.0) * SizeConfig.screenWidth > fontSize
      ? fontSize
      : (fontSize / 400.0) * SizeConfig.screenWidth!;
}

TextStyle bodyTextStyle36(
        {Color color = const Color(0xFF757575),
        fontWeight = FontWeight.normal,
        en=true}) =>
    TextStyle(
        fontSize: reSize(36.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);

TextStyle bodyTextStyle32(
        {Color color = const Color(0xFF757575),
        fontWeight = FontWeight.normal,
        en=true}) =>
    TextStyle(
        fontSize: reSize(32.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);

TextStyle bodyTextStyle28(
        {Color color = const Color(0xFF757575),
        fontWeight = FontWeight.normal,
        en=true}) =>
    TextStyle(
        fontSize: reSize(28.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);
TextStyle bodyTextStyle24(
        {Color color = const Color(0xFF757575),
        fontWeight = FontWeight.normal,
        en=true}) =>
    TextStyle(
        fontSize: reSize(24.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);
TextStyle bodyTextStyle20(
        {Color color = const Color(0xFF757575),
        fontWeight = FontWeight.normal,
        en=true}) =>
    TextStyle(
        fontSize: reSize(20.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);
TextStyle bodyTextStyle18({
  Color color = const Color(0xFF757575),
  fontWeight = FontWeight.normal, //fontFamily= 'SansArabic',
  overflow = TextOverflow.ellipsis,
  en=true}) =>
    TextStyle(
        fontSize: reSize(18.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);
TextStyle bodyTextStyle16(
        {Color color = const Color(0xFF757575),
        overflow = TextOverflow.ellipsis,
        fontWeight = FontWeight.normal,
        en=true}) =>
    TextStyle(
        fontSize: reSize(16.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);
TextStyle bodyTextStyle14(
        {Color color = const Color(0xFF757575),
        fontWeight = FontWeight.normal     , en=true}) =>
    TextStyle(
        fontSize: reSize(14.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);
TextStyle bodyTextStyle12(
        {Color color = const Color(0xFF757575),
        fontWeight = FontWeight.normal , en=true}) =>
    TextStyle(
        fontSize: reSize(12.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);
TextStyle bodyTextStyle10(
    {Color color = const Color(0xFF757575),
      fontWeight = FontWeight.normal , en=true}) =>
    TextStyle(
        fontSize: reSize(10.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);
TextStyle bodyTextStyle8(
    {Color color = const Color(0xFF757575),
      fontWeight = FontWeight.normal , en=true}) =>
    TextStyle(
        fontSize: reSize(8.0),
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
        fontFamily: en ? "NotoSerif" : 'SansArabic',
        color: color);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.appBarBackGround,
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    appBarTheme: const AppBarTheme(
      color: AppColors.appBarBackGround,
      iconTheme: IconThemeData(color: AppColors.main2),
    ),
    snackBarTheme: const SnackBarThemeData(
        elevation: 0,
        backgroundColor: AppColors.main2,
        actionTextColor: AppColors.appBarBackGround),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.main,
        foregroundColor: AppColors.appBarBackGround),
    fontFamily: 'SansArabic',
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    backgroundColor: AppColors.black,
    primaryColor: AppColors.main2,
    appBarTheme: const AppBarTheme(
      color: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.appBarBackGround),
    ),
    textTheme: const TextTheme(),
    fontFamily: 'SansArabic',
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

appBarTheme() {}

InputDecorationTheme inputDecorationTheme() {
  // InputBorder outlineInputBorder = InputBorder();

  return const InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,

    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    // enabledBorder: outlineInputBorder,
    // focusedBorder: outlineInputBorder,
    //  border: outlineInputBorder,
  );
}

class AppColors {
  static const Color main2 = Color(0xFFE60021); // #e60021
  static const Color main = Color(0xFFc40021);
  static const Color shadow1 = Color(0x14000000);
  static const Color shadow2 = Color(0x44000000);
  static const Color shadow3 = Color(0xffd2dbe3);

  static const Color blueGrey1 = Color(0xff374f68);

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  static const Color transparent = Colors.transparent;

  static const Color backGround = Color(0xfff0f3f6);
  static const Color appBarBackGround = Colors.white;
  static const Color green = Colors.green;
  static const Color divider1 = Color(0xFFC9C9C9);
  static const Color lightGrey1 = Color(0xFF636363);
  static const Color getPointButtonColor = Color(0xFFFF8F00);

  static const Color greyText1 = Color(0xFF878787);
  static const Color productsButtonColor = Color(0xFF97B837);
  static const kPrimaryBlueColor = Color(0xFF18a1ca);
  static const kPrimaryRedColor = Color(0xFFE60021);
  static const kPrimaryAmberColor = Color(0xFFFF8F00);

  static const kPrimary2RedColor = Color(0xFFc40021);
  static List<Color> glcColors = <Color>[
    const Color(0xFF97B837),
    const Color(0xFF18a1ca),
    const Color(0xFFFF8F00),
    const Color(0xFF636363),
    const Color(0xFFc40021),
  ];
  static const Color profileImageSelectColor = Color(0xFFB1B1B1);
  static const Color borderSideColor1 = Color(0xFF636363);
  static const Color profileFormFieldsColor = Color(0xFF666666);
  static List<Color> normalColors = <Color>[
    const Color(0xFFa8062c),
    const Color(0xFFdf0023),
    const Color(0xFFe31142),
    const Color(0xFFb40021),
  ];
  static List<Color> silverColors = <Color>[
    const Color(0xFFC6C6C6), //#D5D5D5
    const Color(0xFFD5D5D5), //#C6C6C6
    const Color(0xFFD5D5D5), //#A4A4A4
    const Color(0xFFA4A4A4),
  ];
  static List<Color> goldColors = <Color>[
    const Color(0xFFD3BF8F), // #D3BF8F
    const Color(0xFFD3BF8F), // #C7AE7B
    const Color(0xFFD3BF8F), // #C1A46E
    const Color(0xFFC1A46E),
  ];

  static const Color normalArt = Color(0xFFE60021);
  static const Color silverArt = Color(0xFFA4A4A4);
  static const Color goldArt = Color(0xFFC1A46E);
  static const boxShadow1 = BoxShadow(
      color: greyText1, blurRadius: 8, offset: Offset(0, 8), spreadRadius: 1);
  static const boxShadow2 = BoxShadow(
      color: AppColors.shadow3,
      blurRadius: 4,
      offset: Offset(0, 4),
      spreadRadius: 1);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
