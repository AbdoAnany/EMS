//@dart=2.9
import 'package:flutter/material.dart';

class SplashMobileScreen extends StatelessWidget {
  const SplashMobileScreen({Key key}) : super(key: key);

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
            Image.asset('assets/images/logo.png',width: 200,height: 200),
            const Text(' Mobile ',),
          ]),
    );
  }
}
