import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter_game/constants/globals.dart';
import 'package:flutter_game/games/running_game.dart';
import 'package:flutter_game/inputs/tappableComponent.dart';

class ZombieComponent extends SpriteAnimationComponent
    with HasGameRef<RunningGame> {
  ZombieComponent();

  double spriteHeight = 180;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // sprite = await gameRef.loadSprite(Globals.playerIdleSprite);
    // position = gameRef.size / 1.75;
    position = Vector2(gameRef.size.x / 2.2, gameRef.size.y / 2.4);
    height = spriteHeight;
    width = spriteHeight * 0.8;
    anchor = Anchor.topCenter;
    // angle = 100;
    transform.flipHorizontally();

    getAnimation("Idle");
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  idle() async {
    height = spriteHeight;
    width = spriteHeight * 0.8;
    await getAnimation("Idle");
  }

  run() async {
    height = spriteHeight;
    width = spriteHeight * 0.75;
    await getAnimation("Run");
  }

  jump() async {
    height = spriteHeight;
    width = spriteHeight * 0.75;
    await getAnimation("Jump");
  }

  slide() async {
    height = spriteHeight;
    width = spriteHeight * 0.8;
    await getAnimation("Slide");
  }

  dead() async {
    height = spriteHeight;
    width = spriteHeight;
    await getAnimation("Dead", spriteCount: 13);
    animation!.loop = false;
    animation!.onComplete = () {
      opacity = 0;
    };
  }

  getAnimation(String action, {int spriteCount: 15}) async {
    List<Sprite> spritesList = [];
    List<double> stepTime = [];
    for (var i = 1; i < spriteCount; i++) {
      spritesList.add(await gameRef
          .loadSprite("${Globals.zombieFemaleSprite}/$action ($i).png"));
      stepTime.add(0.2);
    }

    animation = SpriteAnimation.variableSpriteList(
      spritesList,
      stepTimes: stepTime,
    );
  }
}
