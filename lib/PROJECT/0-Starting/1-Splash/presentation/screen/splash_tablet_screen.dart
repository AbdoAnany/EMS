//@dart=2.9
import 'package:flutter/material.dart';

class SplashTabletScreen extends StatelessWidget {
  const SplashTabletScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Image.asset('assets/images/logo.png',width: 150,height: 150),
        const Text('Splash Tablet Screen',)
      ]),
    );
  }
}

