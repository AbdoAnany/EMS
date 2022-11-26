//@dart=2.9

import 'package:ems/PROJECT/2-Home/User/domain/entites/UserEntites.dart';


class UserModel extends UserEntities {
  UserModel({id,requestBy,subject, assignTo, priority,status,createDate,dueDate,action})
      : super(id: id,requestBy: requestBy,subject:subject ,assignTo: assignTo,priority:priority ,status:status ,createDate: createDate, dueDate:dueDate ,action:action );
}
