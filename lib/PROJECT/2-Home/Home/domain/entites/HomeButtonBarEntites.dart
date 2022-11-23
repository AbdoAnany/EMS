//@dart=2.9
import 'package:ems/core/utilities/enum.dart';

class HomeButtonBarEntities {

  final String id;
  final HomeTab homeTab;
  final String icon;
  Function onPress;
  bool selected;

  HomeButtonBarEntities({this.id, this.homeTab, this.icon, this.onPress,this.selected=false});
}