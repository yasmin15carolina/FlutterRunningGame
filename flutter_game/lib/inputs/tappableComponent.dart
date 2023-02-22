import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter_game/components/player_component.dart';

class TappableComponent extends PositionComponent with Tappable {
  final PlayerComponent player;
  TappableComponent({required this.player});

  @override
  bool onTapUp(TapUpInfo event) {
    print("tap up");
    player.idle();
    return true;
  }

  @override
  bool onTapDown(TapDownInfo event) {
    print("tap down");
    player.run();
    return true;
  }

  @override
  bool onTapCancel() {
    print("tap cancel");
    return true;
  }
}
