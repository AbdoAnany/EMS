//@dart=2.9
import 'package:ems/core/utilities/enum.dart';

class UserEntities {

  final int id;
  final String requestBy;
  final String subject;
  final String priority;
  final String status;
  final String createDate;
  final String dueDate;
  final String action;
  final String assignTo;

  Function onPress;
  bool selected;

  UserEntities(
      {this.id,
      this.requestBy,
      this.subject,
      this.priority,
      this.status,
      this.createDate,
      this.dueDate,
      this.action,
      this.assignTo});

}