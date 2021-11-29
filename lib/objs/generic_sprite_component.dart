import 'package:flame/components.dart';

class GenericSpriteComponent extends SpriteComponent
    with HasHitboxes, Collidable {
  int timerAnimation = 1;
  int refImg = 1;


  animation(
      {required double timeFrame,
      required int quantitySprite,
      required String nameSprite}) async {
    timerAnimation += 1;
    if (timerAnimation >= timeFrame) {
      timerAnimation = 0;
      refImg += 1;
    }

    if (refImg > quantitySprite) {
      refImg = 1;
    }
    sprite = await Sprite.load('$nameSprite$refImg.png');
  }
}
