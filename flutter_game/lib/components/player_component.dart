import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter_game/constants/globals.dart';
import 'package:flutter_game/games/running_game.dart';
import 'package:flutter_game/inputs/tappableComponent.dart';

enum MovementState {
  idle,
  slideLeft,
  slideRight,
  frozen,
}

class PlayerComponent extends SpriteAnimationComponent
    with HasGameRef<RunningGame> {
  final JoystickComponent joystick;
  var lastDirection = JoystickDirection.idle;
  bool isJumping = false;
  bool isRunning = false;
  bool isSliding = false;
  bool isAttacking = false;

  PlayerComponent({
    required this.joystick,
  });

  double spriteHeight = 150;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // sprite = await gameRef.loadSprite(Globals.playerIdleSprite);
    // position = gameRef.size / 1.75;
    position = Vector2(gameRef.size.x / 3, gameRef.size.y / 2.1);
    height = spriteHeight;
    width = spriteHeight * 0.6;
    anchor = Anchor.topCenter;

    getAnimation("Idle");
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  idle() async {
    height = spriteHeight;
    width = spriteHeight * 0.6;
    isRunning = false;
    await getAnimation("Idle");
  }

  run() async {
    height = spriteHeight;
    width = spriteHeight * 0.75;
    isRunning = true;
    await getAnimation("Run");
  }

  jump() async {
    height = spriteHeight;
    width = spriteHeight * 0.75;
    await getAnimation("Jump");
  }

  slide() async {
    height = spriteHeight;
    width = spriteHeight;
    await getAnimation("Slide");
  }

  attack() async {
    height = spriteHeight;
    width = spriteHeight;
    await getAnimation("Attack");
  }

  startJump() {
    y -= 50;
    jump();
    isJumping = true;
  }

  stopJump() {
    y += 50;
    idle();
    isJumping = false;
  }

  startSlide() {
    y += 30;
    spriteHeight -= 30;
    slide();
    isSliding = true;
  }

  stopSlide() {
    y -= 30;
    spriteHeight += 30;
    idle();
    isSliding = false;
  }

  startAttack() {
    y += 10;
    x += 10;
    attack();
    isAttacking = true;
  }

  stopAttack() {
    y -= 10;
    x -= 10;
    idle();
    isAttacking = false;
  }

  getAnimation(String action) async {
    List<Sprite> spritesList = [];
    List<double> stepTime = [];
    for (var i = 0; i < 10; i++) {
      spritesList.add(await gameRef
          .loadSprite("${Globals.playerSprite}/${action}__00$i.png"));
      stepTime.add(0.1);
    }

    animation = SpriteAnimation.variableSpriteList(
      spritesList,
      stepTimes: stepTime,
    );
  }

  // @override
  // void update(double dt) {
  //   super.update(dt);

  //   if (joystick.direction != lastDirection) {
  //     lastDirection = joystick.direction;
  //     if (joystick.direction == JoystickDirection.right) {
  //       run();
  //       return;
  //     } else if (joystick.direction == JoystickDirection.idle) {
  //       idle();
  //       return;
  //     } else if (joystick.direction == JoystickDirection.up) {
  //       jump();
  //       return;
  //     }
  //   }
  // }
}
