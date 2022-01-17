import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flutter/services.dart';
import 'package:game03/langawGame.dart';
import 'package:flutter/gestures.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setOrientation(DeviceOrientation.portraitUp);
  LangawGame game=LangawGame();
  runApp(game.widget);

  //TapGestureRecognizer tapper = TapGestureRecognizer();
  //tapper.onTapDown=game.onTapDown;
//tapper.onTapDown = game.onTapDown;
//Flame.util.addGestureRecognizer(tapper);
}
