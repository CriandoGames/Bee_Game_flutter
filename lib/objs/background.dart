import 'package:flame/components.dart';

class Background extends SpriteComponent {
  void move(
      {required double dateTime,
      required double linmitY,
      required double posY}) {
    y += 80 * dateTime;

    if (y >= linmitY) {
      y = posY;
    }
  }
}




