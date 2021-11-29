import 'dart:math';

import 'generic_sprite_component.dart';

class Flower extends GenericSpriteComponent {
  move({required double deltaTime, required double speed}) {
    y += speed * deltaTime;

    if (y > 900) {
      random();
    }
  }

  random() {
    y = -50;
    x = Random().nextInt(500).toDouble();
  }
}