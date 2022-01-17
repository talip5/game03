import 'dart:math';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game03/langawGame.dart';

class Fly1{

  LangawGame game;

  Rect flyRect1;
  Paint flyPaint1;
  Rect flyRectId;
  Paint flyPaintId;
  Rect flyRectFirst;
  Paint flyPaintFirst;
  Size screenSize;

  Fly1(double x1, double y1,double flySizex,double flySizey) {
    flyRect1 = Rect.fromLTWH(x1, y1,flySizex,flySizey);
    flyPaint1 = Paint();
    flyPaint1.color = Color(0xff6ab04c);
    //print('tileSize ${game.tileSize}');
  }

  Fly1.id(double idx) {
    flyRectId = Rect.fromLTWH(0, idx, 45,45);
    flyPaintId = Paint();
    flyPaintId.color = Color(0xff6ab04c);
    //print('tileSize ${game.tileSize}');
  }

  Fly1.first() {
    flyRectFirst = Rect.fromLTWH(300, 300, 15,15);
    flyPaintFirst = Paint();
    flyPaintFirst.color = Color(0xff6ab04c);
    //print('tileSize ${game.tileSize}');
  }

  void render(Canvas c) {
    //c.drawRect(flyRect1, flyPaint1);
    // print('flyRect : ${flyRect.top} ');
  }

  void update(double t) {

  }

  void resize(Size size) {
    screenSize=size;
  }

}