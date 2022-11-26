//@dart=2.9

import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeState.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/widget/0_home_bar.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/controller/HomeCubit.dart';
import 'package:ems/PROJECT/2-Home/Home/presentation/widget/1_Home_View.dart';
import 'package:ems/PROJECT/2-Home/User/date/models/UserModel.dart';
import 'package:ems/PROJECT/2-Home/User/presentation/controller/UserCubit.dart';
import 'package:ems/PROJECT/2-Home/User/presentation/controller/UserState.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/size_config.dart';
import 'package:ems/core/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
        builder: (e, s) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(12),
                // padding:EdgeInsets.all(12) ,
                height: (SizeConfig.screenHeight * .78)-60.0,

                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.main.withOpacity(.3))),
                child: FutureBuilder<List<UserModel>>(
                  future: UserCubit.getAllUserData(),
                  builder: (context, as) => SfDataGrid(

                    source: UserCubit.allUserDataSource,
                    allowSorting: true,allowColumnsResizing: true,
                    allowSwiping: true,
                    showSortNumbers: true,


                    columnWidthMode: ColumnWidthMode.fill,
                    columns: UserCubit.listAllUserGridColumn.toList(),
                  ),
                ),
              ),
              Container(

                  height: 60.0,
                  child: SfDataPager(
                    delegate: DataPagerDelegate(),

                    pageCount:  UserCubit.listAllUserGridColumn.length / 5,
                    direction: Axis.horizontal,
                  ))
            ],
          );
        },
        listener: (e, s) {});
  }
}
