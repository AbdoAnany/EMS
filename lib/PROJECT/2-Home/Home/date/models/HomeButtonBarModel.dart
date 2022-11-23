//@dart=2.9
import 'package:ems/PROJECT/2-Home/Home/domain/entites/HomeButtonBarEntites.dart';
import 'package:flutter/cupertino.dart';

class HomeButtonBarModel extends HomeButtonBarEntities {
  HomeButtonBarModel({id,homeTab,icon, onPress, selected})
      : super(icon: icon,homeTab:homeTab,id:id, onPress: onPress, selected: selected);
}
