import 'dart:ui';
import 'package:game03/langawGame.dart';
import 'package:flame/game.dart';

class Fly {

  final LangawGame game;

  Rect flyRect;
  Paint flyPaint;
  Rect flyRect1;
  Paint flyPaint1;

  bool isDead = false;
  bool isOffScreen = false;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint();
    flyPaint.color = Color(0xff6ab04c);
    print('tileSize ${game.tileSize}');
  }

  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
    // print('flyRect : ${flyRect.top} ');
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12/10 * t);
    }
    if (flyRect.top > game.screenSize.height) {
      isOffScreen = true;
    }
  }

  void resize(Size size) {
  }

  void onTapDown() {
    isDead = true;
    flyPaint.color = Color(0xffff4757);
    game.spawnFly();
  }

}