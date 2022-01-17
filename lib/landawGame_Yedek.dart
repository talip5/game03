import 'dart:ui';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game03/components/fly.dart';
import 'package:flame/flame.dart';
import 'dart:math';
import 'package:flutter/gestures.dart';


class LangawGame extends Game with TapDetector{
  Size screenSize;
  double tileSize;
  List<Fly> flies;
  Random rnd;
  double count=0.0;

  LangawGame() {
    initialize();
  }

  void initialize() async {
    //flies = List<Fly>();
    flies =[];
    rnd = Random();
    resize(await Flame.util.initialDimensions());
    spawnFly();
    print('initialize');
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - tileSize);
    double y = rnd.nextDouble() * (screenSize.height - tileSize);
    flies.add(Fly(this, x, y));
    print('flies35 : ${flies.length}');
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0,0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    // canvas.drawRect(, paint)
    //print(screenSize.width);
    //print('render $count');
    //flies.forEach((Fly fly) => fly.render(canvas));
    flies.first.render(canvas);
  }

  void update(double t) {
    count +=t;
    //flies.forEach((Fly fly) => fly.update(t));
    //flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize=size;
    tileSize = screenSize.width / 9;
  }

  void onTapDown(TapDownDetails d) {
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        print(d.globalPosition.dy);
        fly.onTapDown();
      }
    });
  }
}