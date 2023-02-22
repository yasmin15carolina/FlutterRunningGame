import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flutter/painting.dart';

JoystickComponent joystick = JoystickComponent(
  knob: CircleComponent(
    radius: 30,
    paint: BasicPalette.blue.withAlpha(200).paint(),
  ),
  background: CircleComponent(
      radius: 100, paint: BasicPalette.blue.withAlpha(100).paint()),
  margin: const EdgeInsets.only(
    right: 40,
    bottom: 40,
  ),
);
