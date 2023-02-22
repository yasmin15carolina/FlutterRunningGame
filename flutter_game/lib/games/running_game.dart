import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flutter_game/components/background_component.dart';
import 'package:flutter_game/components/player_component.dart';
import 'package:flutter_game/components/tile_component.dart';
import 'package:flutter_game/components/back_component.dart';
import 'package:flutter_game/components/zombie_component.dart';
import 'package:flutter_game/inputs/joystick.dart';
import 'package:flutter_game/inputs/tappableComponent.dart';

class RunningGame extends FlameGame
    with DoubleTapDetector, LongPressDetector, VerticalDragDetector {
  var player = PlayerComponent(joystick: joystick);
  var zombie = ZombieComponent();
  var backComponent = BackComponent();

  @override
  void onLongPressStart(LongPressStartInfo info) {
    player.run();
    backComponent.moving = true;
  }

  @override
  void onLongPressEnd(LongPressEndInfo info) {
    player.idle();
    backComponent.moving = false;
  }

  Offset drag = Offset.zero;

  @override
  void onVerticalDragStart(DragStartInfo info) {
    // TODO: implement onVerticalDragStart
    super.onVerticalDragStart(info);
    drag = info.raw.localPosition; 
  }

  @override
  void onVerticalDragUpdate(DragUpdateInfo info) {
    super.onVerticalDragUpdate(info);
    if (!player.isJumping && !player.isSliding) {
      if (info.raw.localPosition.dy < drag.dy) {
        player.startJump();

        Future.delayed(const Duration(milliseconds: 500), () async {
          player.stopJump();
        });
      } else {
        player.startSlide();

        Future.delayed(const Duration(milliseconds: 500), () async {
          player.stopSlide();
        });
      }
    }
  }

  @override
  void onDoubleTap() {
    super.onDoubleTap();
    if (!player.isAttacking) {
      player.startAttack();
      zombie.dead();
      Future.delayed(const Duration(milliseconds: 1500), () async {
        player.stopAttack();
      });
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());
    add(backComponent);

    double tamanho = size.x / 100;

    for (var i = 0; i < tamanho + 1; i++) {
      add(TileComponent(i * 100));
    }
    // TappableComponent tappableComponent = TappableComponent(player: player);

    // tappableComponent.size = size;
    // add(tappableComponent);
    add(zombie);
    add(player);

    // DraggableComponent draggableComponent = DraggableComponent(player: player);
    // draggableComponent.size = size;
    // add(draggableComponent);

    // add(joystick);
  }
}
