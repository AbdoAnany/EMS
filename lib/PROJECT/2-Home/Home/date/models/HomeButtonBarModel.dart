//@dart=2.9
import 'package:ems/PROJECT/2-Home/Home/domain/entites/HomeButtonBarEntites.dart';
import 'package:flutter/cupertino.dart';


class HomeButtonBarModel extends HomeButtonBarEntities {
    HomeButtonBarModel(
      {name,
      onPress,selected})
      : super(name:name,onPress:onPress,selected:selected);
}
