//@dart=2.9
import 'package:ems/PROJECT/2-Home/Home/date/models/HomeButtonBar.dart';
import 'package:ems/PROJECT/2-Home/User/date/models/UserModel.dart';
import 'package:ems/core/content.dart';
import 'package:ems/core/style/styles.dart';
import 'package:ems/core/utilities/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'UserState.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());

  static GlobalKey<ScaffoldState> scaffoldHomeKey = GlobalKey<ScaffoldState>();
  static double barMax = 200;
  static double barMin = 60;
  static UserCubit get(context) => BlocProvider.of(context);
  static List<UserModel> allUser = <UserModel>[];
  static UserDataSource allUserDataSource =
      UserDataSource(employeeData: allUser);

  static Future<List<UserModel>> getAllUserData() async {
    allUser = [
      UserModel(
          id: 10001,
          requestBy: 'James',
          subject: 'Project Lead',
          status: 'new',
          assignTo: 'A.Anany',
          priority: 'High',
          createDate: DateTime.now().toString().split(' ').first,
          dueDate: DateTime.now().toString().split(' ').first,
          action: "action"),
      UserModel(
          id: 10002,
          requestBy: 'Kathryn',
          subject: 'Manager',
          status: 'update',
          assignTo: 'A.Anany',
          priority: 'Medium',
          createDate: DateTime.now().toString().split(' ').first,
          dueDate: DateTime.now().toString().split(' ').first,
          action: "action"),
      UserModel(
          id: 10003,
          requestBy: 'Lara',
          subject: 'Developer',
          status: 'padding',
          assignTo: 'A.Anany',
          priority: 'Low',
          createDate: DateTime.now().toString().split(' ').first,
          dueDate: DateTime.now().toString().split(' ').first,
          action: "action"),
      UserModel(
          id: 10004,
          requestBy: 'Michael',
          subject: 'Designer',
          status: 'new',
          assignTo: 'A.Anany',
          priority: 'Low',
          createDate: DateTime.now().toString().split(' ').first,
          dueDate: DateTime.now().toString().split(' ').first,
          action: "action"),
      UserModel(
          id: 10005,
          requestBy: 'Martin',
          subject: 'Developer',
          status: 'update',
          assignTo: 'A.Anany',
          priority: 'Medium',
          createDate: DateTime.now().toString().split(' ').first,
          dueDate: DateTime.now().toString().split(' ').first,
          action: "action"),
      UserModel(
          id: 10006,
          requestBy: 'Newberry',
          subject: 'Developer',
          status: 'update',
          assignTo: 'A.Anany',
          priority: 'High',
          createDate: DateTime.now().toString().split(' ').first,
          dueDate: DateTime.now().toString().split(' ').first,
          action: "action"),
      UserModel(
          id: 10007,
          requestBy: 'Balnc',
          subject: 'Developer',
          status: 'delete',
          assignTo: 'A.Anany',
          priority: 'Medium',
          createDate: DateTime.now().toString().split(' ').first,
          dueDate: DateTime.now().toString().split(' ').first,
          action: "action"),
      UserModel(
          id: 10008,
          requestBy: 'Perry',
          subject: 'Developer',
          status: 'padding',
          assignTo: 'A.Anany',
          priority: 'Low',
          createDate: DateTime.now().toString().split(' ').first,
          dueDate: DateTime.now().toString().split(' ').first,
          action: "action"),
      UserModel(
          id: 10009,
          requestBy: 'Gable',
          subject: 'Developer',
          status: 'new',
          assignTo: 'A.Anany',
          priority: 'High',
          createDate: DateTime.now().toString().split(' ').first,
          dueDate: DateTime.now().toString().split(' ').first,
          action: "action"),
      UserModel(
          id: 10010,
          requestBy: 'Grimes',
          subject: 'Developer',
          status: 'delete',
          assignTo: 'A.Anany',
          priority: 'Low',
          createDate: DateTime.now().toString().split(' ').first,
          dueDate: DateTime.now().toString().split(' ').first,
          action: "action")
    ];
    allUserDataSource = UserDataSource(employeeData: allUser);
    //  emit(UserState1());
    return allUser;
  }

  static List<GridColumn> listAllUserGridColumn = <GridColumn>[
    GridColumn(
        columnName: 'ID',
        allowSorting: true,
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'ID',
            ))),
    GridColumn(
        columnName: 'Request By',
        allowSorting: true,
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'Request By',
            ))),
    GridColumn(
        columnName: 'Subject',
        allowSorting: true,
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'Subject',
            ))),
    GridColumn(
        columnName: 'Assign To',
        allowSorting: true,
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'Assign To',
            ))),
    GridColumn(
        columnName: 'Status',
        allowSorting: true,
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'Status',
            ))),
    GridColumn(
        columnName: 'Priority',
        allowSorting: true,
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'Priority',
            ))),
    GridColumn(
        columnName: 'Create Date',
        allowSorting: true,
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'Create Date',
            ))),
    GridColumn(
        columnName: 'Due Date',
        allowSorting: true,
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'Due Date',
            ))),
    GridColumn(
        columnName: 'Action',
        allowSorting: true,
        label: Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: const Text(
              'Action',
            ))),
  ];
}

class UserDataSource extends DataGridSource {
  UserDataSource({List<UserModel> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(

        cells: [
              DataGridCell<int>(columnName: 'ID', value: e.id,),
              DataGridCell<String>(columnName: 'Request By', value: e.requestBy),
              DataGridCell<String>(columnName: 'Subject', value: e.subject),
              DataGridCell<String>(columnName: 'Assign To', value: e.assignTo),
              DataGridCell<String>(columnName: 'Status', value: e.status),
              DataGridCell<String>(columnName: 'Priority', value: e.priority),
              DataGridCell<String>(columnName: 'Create Date', value: e.createDate),
              DataGridCell<String>(columnName: 'Due Date', value: e.dueDate),
              DataGridCell<String>(columnName: 'Action', value: e.action),
            ],))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      if (e.columnName == 'Status') {
        return Container(
          alignment: Alignment.center,
          width: 40,height: 25,
          // padding: const EdgeInsets.all(8),
           margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 12),
          decoration: BoxDecoration(
          //    color:AppColors.gray.withOpacity(.1),
              borderRadius: BorderRadius.circular(12)),
          child: Text(e.value.toString(), style: TextStyle(fontSize: 14,
            color: e.value.toLowerCase() == 'new'
              ? AppColors.main4.withOpacity(1)
              : e.value.toLowerCase() == 'delete'
              ? AppColors.main3.withOpacity(1)
              : e.value.toLowerCase() == 'padding'
                ? AppColors.main1.withOpacity(1):AppColors.blueGrey.withOpacity(1), )
          ),
        );
      }
      else  if (e.columnName == 'Priority') {
        return Container(
          alignment: Alignment.center,
          width: 40,height: 30,
           padding: const EdgeInsets.symmetric(vertical: 4),
          margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 12),
          decoration: BoxDecoration(
              color: e.value.toLowerCase() == 'low'
                  ? AppColors.main4.withOpacity(.1)
                  : e.value.toLowerCase() == 'high'
                  ? AppColors.main3.withOpacity(.1)
                  : AppColors.main1.withOpacity(.1),
              borderRadius: BorderRadius.circular(12)),
          child: Text(e.value.toString(), style: TextStyle(fontSize: 14,   color: e.value.toLowerCase() == 'low'
              ? AppColors.main4.withOpacity(1)
              : e.value.toLowerCase() == 'high'
              ? AppColors.main3.withOpacity(1)
              : AppColors.main1.withOpacity(1), )
          ),
        );
      }
      else  if (e.columnName == 'ID') {
        return Container(
          alignment: Alignment.center,
          width: 40,height: 25,
          // padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 12),

          child: Text(e.value.toString(), style: TextStyle(fontSize: 14,   color: AppColors.main.withOpacity(1),fontWeight: FontWeight.bold )
          ),
        );
      }
      else {
        return Container(
          alignment: Alignment.center,
       //   color: AppColors.white,
          padding: const EdgeInsets.all(8.0),
          child: Text(e.value.toString()),
        );
      }
    }).toList());
  }
}
