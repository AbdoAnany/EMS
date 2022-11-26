//@dart=2.9

import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeState.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/widget/0_home_bar.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/widget/1_Home_View.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return BlocConsumer<HomeCubit, HomeState>(
        builder: (e, s) {
          return SafeArea(
            child: Scaffold(
                key: HomeCubit.scaffoldHomeKey,
                body: WillPopScope(
                  onWillPop: () => Future.value(true),
                  child: Container(
                    color: AppColors.bg1,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [HomeBar(), HomeView()],
                    ),
                  ),
                )),
          );
        },
        listener: (e, s) {});
  }
}
