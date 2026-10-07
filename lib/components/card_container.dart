import 'package:flutter/material.dart';

class CardContainer extends Container {
  CardContainer({
    super.key,
    super.alignment,
    super.child,
    super.decoration = const BoxDecoration(
      color: Colors.white,
      border: Border.symmetric(
        vertical: BorderSide(color: Color(0xFF9A95E3), width: 1),
        horizontal: BorderSide(color: Color(0xFF9A95E3), width: 1),
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    super.clipBehavior,
    super.constraints,
    super.foregroundDecoration,
    super.isAntiAlias,
    super.height,
    super.width,
    super.margin,
    super.padding = const EdgeInsets.all(14),
  });
}
