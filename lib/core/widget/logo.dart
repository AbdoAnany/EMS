//@dart=2.9
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/style/styles.dart';
import 'package:ems/core/utilities/images.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.transparent),
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(0, 8, 0, 8),)
        ),
        label: HomeCubit.isHomeBarExpanded ? Text('  Admin  ', style: textStyleHeaderLight) : SizedBox(),
        icon: AnimatedContainer(
          height:  HomeCubit.isHomeBarExpanded?70:50,
          width:  HomeCubit.isHomeBarExpanded?70:50,
          duration: const Duration(milliseconds: 300),
          child: Image.asset(Img.logo,),
        ));
  }
}
