import 'package:bee_honey/game/app.dart';
import 'package:bee_honey/game/splash.dart';
import 'package:flutter/material.dart';

Widget gameOver(BuildContext context, App game) {
  final h = MediaQuery.of(context).size.height;
  final w = MediaQuery.of(context).size.width;

  return Scaffold(
    body: GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Splash()),
        );
      },
      child: SizedBox(
        height: h,
        width: w,
        child: Image.asset(
          'assets/images/gameover.png',
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}
