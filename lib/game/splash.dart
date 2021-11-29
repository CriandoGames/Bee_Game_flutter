import 'package:bee_honey/game/app.dart';
import 'package:bee_honey/shared/shared.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'game_over.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          isGameOver = false;
          score = 0;
        
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GameWidget(
                  game: App(),
                  overlayBuilderMap: const {"GameOver": gameOver },
                ),
              ));
        },
        child: SizedBox(
          height: h,
          width: w,
          child: Image.asset(
            'assets/images/start.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
