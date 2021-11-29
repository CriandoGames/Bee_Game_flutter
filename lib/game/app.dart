import 'package:bee_honey/canvas/game_text.dart';
import 'package:bee_honey/objs/background.dart';
import 'package:bee_honey/shared/shared.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../objs/flower.dart';
import '../objs/player.dart';
import '../objs/spider.dart';

class App extends FlameGame with KeyboardEvents, HasCollidables {
  Background bg = Background();
  Background bg2 = Background();
  Player player = Player();
  Spider spider = Spider();
  Flower flower = Flower();

  GameText gameTextScore =
      GameText(text: "Score: 0", x: 10, y: 10, color: Colors.white);

  GameText gameTextPlayerLife =
      GameText(text: "Life: 3", x: 425, y: 10, color: Colors.white);

  @override
  Future<void>? onLoad() async {
    bg
      ..sprite = await Sprite.load('bg.png')
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, 0);

    bg2
      ..sprite = await Sprite.load('bg.png')
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, -900);

    player
      ..sprite = await Sprite.load('bee1.png')
      ..size = Vector2(50, 50)
      ..position = Vector2(250, 800)
      ..anchor = Anchor.center
      ..addHitbox(HitboxRectangle());

    spider
      ..sprite = await Sprite.load('spider1.png')
      ..size = Vector2.all(80)
      ..anchor = Anchor.center
      ..position = Vector2(250, 500)
      ..addHitbox(HitboxRectangle());

    flower
      ..sprite = await Sprite.load('florwer1.png')
      ..size = Vector2.all(25)
      ..anchor = Anchor.center
      ..position = Vector2(200, 400)
      ..addHitbox(HitboxRectangle());

    add(bg);
    add(bg2);
    add(player);
    add(spider);
    add(flower);
    add(gameTextPlayerLife);
    add(gameTextScore);

    return super.onLoad();
  }

  @override
  void update(double dt) {
    bg.move(dateTime: dt, linmitY: 900, posY: 0);
    bg2.move(dateTime: dt, linmitY: 0, posY: -900);

    player.move(dataTime: dt, speed: 80);
    player.animation(quantitySprite: 4, timeFrame: 8, nameSprite: 'bee');

    spider.animation(timeFrame: 8, quantitySprite: 4, nameSprite: 'spider');
    spider.move(deltaTime: dt, speed: 50, player: player);

    flower.move(deltaTime: dt, speed: 110);
    flower.animation(timeFrame: dt, quantitySprite: 2, nameSprite: 'florwer');

    gameTextPlayerLife.text = "Life: ${player.life}a";
    gameTextScore.text = "Score: $score";


    if(isGameOver){
      pauseEngine();
      overlays.add('GameOver');

    }

    super.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event.data.keyLabel == 'a') {
      player.left = true;
    } else {
      player.left = false;
    }
    if (event.data.keyLabel == 'd') {
      player.position.x += 1;
      player.right = true;
    } else {
      player.right = false;
    }

    return super.onKeyEvent(event, keysPressed);
  }
}
