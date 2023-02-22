import 'dart:math';

import 'package:flame/components.dart';
import 'package:flutter_game/constants/globals.dart';

import '../games/running_game.dart';

class BackComponent extends SpriteAnimationComponent
    with HasGameRef<RunningGame> {
  final double _spriteHeight = 200;
  // double x;
  bool moving = false;

  BackComponent();
  @override
  Future<void>? onLoad() async {
    super.onLoad();
    double y = gameRef.size.y / 1.6;
    position = Vector2(600, y);
    height = _spriteHeight;
    width = _spriteHeight;
    anchor = Anchor.center;

    List<Sprite> spritesList = [];
    List<double> stepTime = [];
    for (var i = 0; i < 1; i++) {
      spritesList.add(await gameRef.loadSprite(Globals.objects.last
          // Globals.objects[Random().nextInt(Globals.objects.length)],
          ));
      stepTime.add(0.1);
    }

    animation = SpriteAnimation.variableSpriteList(
      spritesList,
      stepTimes: stepTime,
    );

    // sprite = await gameRef
    //     .loadSprite(Globals.objects[Random().nextInt(Globals.objects.length)]);
  }

  @override
  void update(double dt) {
    if (moving) {
      x = x - 1;
      // y = y + 1;
      print("aaaaaaaaaaaa");
    }
    super.update(dt);
  }
}
