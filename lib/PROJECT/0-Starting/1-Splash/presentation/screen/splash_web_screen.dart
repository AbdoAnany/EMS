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
      child: const Text('Splash Web Screen',),
    );
  }
}

