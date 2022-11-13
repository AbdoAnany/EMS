//@dart=2.9
import 'package:flutter/material.dart';

class SplashWebScreen extends StatelessWidget {
  const SplashWebScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.deepPurple,
      child:
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',width: 300,height: 300),
            const Text('Splash Web Screen',),
          ]),
    );
  }
}

