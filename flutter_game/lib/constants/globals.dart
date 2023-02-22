import 'package:flame/cache.dart';
import 'package:flame/components.dart';

class Globals {
  Globals._();

  static const String playerSprite = 'NinjaGirl';
  static const String zombieFemaleSprite = 'Zombies/female';
  static const String backgroundSprite = 'Background/BG.png';
  static const String tileSprite = 'Tiles/2.png';

  static List<String> objects = [
    'Object/Bush (1).png',
    'Object/Bush (2).png',
    'Object/Bush (3).png',
    'Object/Bush (4).png',
    'Object/Sign_1.png',
    'Object/Sign_2.png',
    'Object/Stone.png',
    'Object/Tree_1.png',
    'Object/Tree_2.png',
    'Object/Tree_3.png',
  ];

  final imagesLoader = Images();
}
