import 'package:bee_honey/shared/shared.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'flower.dart';
import 'generic_sprite_component.dart';
import 'spider.dart';

class Player extends GenericSpriteComponent {
  bool right = false;
  bool left = false;
  int life = 3;

  move({required double dataTime, required double speed}) {
    if (right) {
      if (x <= 475) {
        x += speed * dataTime;
      }
    }
    if (left) {
      if (x >= 25) {
        x -= speed * dataTime;
      }
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);

    if (other is Spider) {
      other.random();
      life--;
      if (life <= 0) {
        isGameOver = true;
      }
    }

    if (other is Flower) {
      other.random();
      score += 1;
    }
  }
}
