//@dart=2.9

import 'package:ems/PROJECT/2-Home/Home/date/models/HomeButtonBar.dart';
import 'package:ems/PROJECT/2-Home/Home/date/models/HomeButtonBarModel.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeState.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/share/functions.dart';

class HomeButtonBar extends StatelessWidget {
  final HomeButtonBarModel homeTabBar;

  const HomeButtonBar({
    Key key,
    this.homeTabBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: HomeCubit(),
      builder: (e, s) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
          child: ElevatedButton.icon(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(homeTabBar.selected
                      ? AppColors.bg1
                      : AppColors.transparent),
                  elevation: MaterialStateProperty.all(0),
                  alignment: Alignment.centerLeft,
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  ),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        8,
                      ),
                      bottomLeft: Radius.circular(
                        8,
                      ),
                    ),
                  )),
                  animationDuration: const Duration(milliseconds: 300)),
              onPressed: homeTabBar.onPress,
              label: HomeCubit.isHomeBarExpanded
                  ? Text(
                      '   ' + homeTabBar.homeTab.name,
                      softWrap: true,
                      style: homeTabBar.selected
                          ? textStyleHeaderMain16
                          : textStyleHeaderLight16,
                    )
                  : const SizedBox(),
              icon: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: iconSvg(homeTabBar.icon, isDark: homeTabBar.selected),
              )),
        );
      },
    );
  }
}
