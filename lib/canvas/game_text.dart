import 'package:flame/components.dart';
import 'package:flutter/painting.dart';

class GameText extends TextComponent {
  GameText({required String text, required double x, required double y,required Color color})
      : super(
            text: text,
            position: Vector2(x, y),
            textRenderer: TextPaint(style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )));
}
