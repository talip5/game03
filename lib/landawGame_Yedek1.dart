import 'dart:math';
import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/material.dart';
import 'package:game03/components/fly1.dart';

class LangawGame extends Game with TapDetector{
  Size screenSize;
  double tileSize;
  List<Fly1> flies;
  double speed=1;
  double fly_x;
  double fly_y;
  double time;
  Random random=Random();
  bool start=false;

  Fly1 _fly1=Fly1(100,100,45,45);
  Fly1 _fly1_id=Fly1.id(0);
  Fly1 _fly1_first=Fly1.first();

  LangawGame() {
    initialize();
  }

  void initialize() async {
    //flies = List<Fly>();
    flies =[];
    resize(await Flame.util.initialDimensions());
    spawnFly();
    //print('initialize');
  }

  spawnFly(){
    fly_x=random.nextDouble() * (screenSize.width - tileSize);
    fly_y=random.nextDouble() * (screenSize.height - tileSize);
    _fly1=Fly1(fly_x,fly_y,tileSize + 45,tileSize + 45);
  }

  void render(Canvas canvas) {
    Rect bgRect = Rect.fromLTWH(0,0, screenSize.width, screenSize.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xff576574);
    canvas.drawRect(bgRect, bgPaint);
    //canvas.drawRect(_fly1.flyRect1, _fly1.flyPaint1);
    // if(speed<200) {
    canvas.drawRect(_fly1_id.flyRectId, _fly1_id.flyPaintId);
    //}
    canvas.drawRect(_fly1_first.flyRectFirst, _fly1_first.flyPaintFirst);
    canvas.drawRect(_fly1.flyRect1,_fly1.flyPaint1);
    if(flies.isNotEmpty){
      canvas.drawRect(flies[0].flyRectId, flies[0].flyPaintId);
    }
    // canvas.drawRect(, paint)
    //print(screenSize.width);
    //print('render $count');
    //flies.forEach((Fly fly) => fly.render(canvas));
    //flies.first.render(canvas);
  }

  void update(double t) async{
    if(start){
      if(speed<200) {
        speed=speed + t * 40;
        _fly1_id = Fly1.id(speed);

      } else {
        await Future.delayed(Duration(
            seconds: 3), () {
          print('xxxx');
          speed=0;
        }
        );
      }
    }
    //print('update');
    //flies.forEach((Fly fly) => fly.update(t));
    //flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void resize(Size size) {
    screenSize=size;
    tileSize = screenSize.width / 9;
  }

  /*void onTapDown(TapDownDetails d) {
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        print(d.globalPosition.dy);
        fly.onTapDown();
      }
    });
  }*/

  @override
  void onTapDown(TapDownDetails details) {
    //print(details.globalPosition.dy);
    if (_fly1.flyRect1.contains(details.globalPosition)) {
      //print(details.globalPosition.dy);
      _fly1.flyPaint1.color=Colors.deepPurple;
      // flies.add(_fly1);
      //print('_fly1 ${flies.length}');
      //fly.onTapDown();
    }
    if (_fly1_id.flyRectId.contains(details.globalPosition)) {
      //print(details.globalPosition.dy);
      _fly1_id.flyPaintId.color=Colors.deepPurple;
      //(spawnFly());
      //flies.add(_fly1_id);
      //print(flies.length);
      start=true;
    }

    if (_fly1_first.flyRectFirst.contains(details.globalPosition)) {
      //print(details.globalPosition.dy);
      _fly1_first.flyPaintFirst.color=Colors.deepPurple;
      //fly.onTapDown();
    }
    super.onTapDown(details);
  }

}