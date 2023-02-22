// import 'package:flame/components.dart';
// import 'package:flutter_game/constants/globals.dart';

// import '../games/running_game.dart';

// class TileComponent extends SpriteComponent with HasGameRef<RunningGame> {
//   final double _spriteHeight = 100;
//   final double x;

//   TileComponent(this.x);
//   @override
//   Future<void>? onLoad() async {
//     super.onLoad();
//     // position = gameRef.size;
//     double y = gameRef.size.y;
//     position = Vector2(x, y);
//     height = _spriteHeight;
//     width = _spriteHeight;
//     anchor = Anchor.center;

//     sprite = await gameRef.loadSprite(Globals.tileSprite);
//   }
// }
