import 'dart:math';

import 'package:flame/components.dart';

import 'generic_sprite_component.dart';

class Spider extends GenericSpriteComponent {
  move(
      {required double deltaTime,
      required double speed,
      required SpriteComponent player}) {
    y += speed * deltaTime;

    if (y >= 950) {
      random();
    }

    if (x < player.x) {
      x += (speed - 20) * deltaTime;
    } else if (x > player.x) {
      x -= (speed - 20) * deltaTime;
    }
  }

  random() {
    y = -50;
    x = Random().nextInt(500).toDouble();
  }
}
