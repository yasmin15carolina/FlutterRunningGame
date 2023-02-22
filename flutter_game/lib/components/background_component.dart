import 'package:flame/components.dart';
import 'package:flutter_game/constants/globals.dart';
import 'package:flutter_game/games/running_game.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef<RunningGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Globals.backgroundSprite);
    size = gameRef.size;
  }
}
