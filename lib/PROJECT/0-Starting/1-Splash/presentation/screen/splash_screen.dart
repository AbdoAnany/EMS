//@dart=2.9
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: ((context, constraints) {
        print(constraints);
        if (constraints.maxWidth > 1400 ){
          //desktop
          return Container(height: constraints.maxHeight,width: constraints.maxWidth, color: Colors.deepPurple,child: Text(constraints.maxWidth.toString(),),);
        }
        else if (constraints.maxWidth > 1200) {
          //desktop
          return Container(height: constraints.maxHeight,width: constraints.maxWidth, color: Colors.red,child: Text(constraints.maxWidth.toString(),),);
        } else if (constraints.maxWidth > 1100) {
          //tablet
          return Container(height: constraints.maxHeight,width: constraints.maxWidth,color: Colors.amberAccent,child: Text(constraints.maxWidth.toString(),),);
        }
        else if (constraints.maxWidth > 800) {
          //tablet
          return Container(height: constraints.maxHeight,width: constraints.maxWidth,color: Colors.blueGrey,child: Text(constraints.maxWidth.toString(),),);
        }
        else if (constraints.maxWidth > 600) {
          //mobile
          return Container(height: constraints.maxHeight,width: constraints.maxWidth,color: Colors.cyan,child: Text(constraints.maxWidth.toString(),),);
        }
        else if (constraints.maxWidth > 450) {
          //mobile
          return Container(height: constraints.maxHeight,width: constraints.maxWidth,color: Colors.brown,child: Text(constraints.maxWidth.toString(),),);
        }
        else {
          return Container(color: Colors.green,);
        }



      })
        ,)


    );
  }
}

