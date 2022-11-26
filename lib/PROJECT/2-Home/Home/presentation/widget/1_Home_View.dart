//@dart=2.9

import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/PROJECT/2-Home/User/presentation/all_user_screen.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/size_config.dart';
import 'package:ems/core/style/styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: SizeConfig.screenWidth -
          (HomeCubit.isHomeBarExpanded ? HomeCubit.barMax : HomeCubit.barMin),
      height: SizeConfig.screenHeight,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              margin: EdgeInsets.all(12),


              decoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius. circular(12)
              ,    border: Border.all(color: AppColors.main.withOpacity(.3))
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'TICKET',
                      style: textStyleHeader,
                    ),
                    const Divider(
                        color: AppColors.gray100,
                        indent: 5,
                        endIndent: 5,
                        thickness: .5),
                    Expanded(
                      child: Text(
                        'Welcome In Home Screen',
                        style: textStyleHeaderMain20,
                      ),
                    )
                  ]),
            ),
            const AllUserScreen()
          ]),
    );
  }
}



